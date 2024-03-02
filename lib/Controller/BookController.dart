

import 'dart:io';

import 'package:campuskartt/Config/Message.dart';
import 'package:campuskartt/Models/BookModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class BookController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController usedFor = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  

  ImagePicker imagePicker = ImagePicker();

  final storage = FirebaseStorage.instance;
  final db = FirebaseFirestore.instance;
  final fAuth = FirebaseAuth.instance;
  RxString imageUrl = "".obs;
  int index = 0;
  RxBool isImageUploading = false.obs;
  RxBool isPostUploading = false.obs;
  var bookData = RxList<ProductData>();
  var currentUserBooks = RxList<ProductData>();



  @override
  void onInit() {
    super.onInit();
    getAllBooks();
    
    
  }

  void getAllBooks() async {
    bookData.clear();
  try {
    
    var querySnapshot = await db.collection("Product").get();
    querySnapshot.docs.forEach((doc) {
      bookData.add(ProductData.fromJson(doc.data()));
    });
    successMessage("Books fetched successfully");
  } catch (e) {
    errorMessage("Error fetching books: $e");
    print(e);
  }
}

  void getUserBook() async {
    currentUserBooks.clear();
  try {
    
    var books = await db.collection("userBook").doc(fAuth.currentUser!.uid).collection("Product").get();
     for (var book in books.docs) {
      currentUserBooks.add(ProductData.fromJson(book.data()));
    }
    successMessage("User Books fetched successfully");
  } catch (e) {
    errorMessage("Error fetching books: $e");
    print(e);
  }
}



 void pickImage() async {
  isImageUploading.value = true;
  final XFile? image =
      await imagePicker.pickImage(source: ImageSource.camera);

  if (image != null) {
    print(image.path);
    File compressedImage = await compressImage(File(image.path));
    uploadImageToFirebase(compressedImage);
  }
  isImageUploading.value = false;
}

Future<File> compressImage(File imageFile) async {
  File compressedFile = await FlutterNativeImage.compressImage(
    imageFile.path,
    quality: 20, // Set the quality of the compressed image
    percentage: 100, // Set the percentage of compression
  );
  return compressedFile;
}


  void uploadImageToFirebase(File image) async {
  var uuid = Uuid();
  var filename = uuid.v1();
  var storageRef = storage.ref().child("Images/$filename");

  
    var metadata = SettableMetadata(contentType: 'image/jpeg');
    var response = await storageRef.putFile(image, metadata);
    String downloadURL = await storageRef.getDownloadURL();
    imageUrl.value = downloadURL;
    print("Download URL: $downloadURL");
    isImageUploading.value = false;

    
    // Handle error
  
}


  void createBook() async {
    isPostUploading.value = true;
    var newBook = ProductData(
      id: "$index",
      title: title.text,
      description: description.text,
      author: author.text,
      category: category.text,
      coverUrl: imageUrl.value,
      price: price.text,
      usedFor: usedFor.text,
      phoneNumber: phoneNumber.text,
    );

    await db.collection("Product").add(newBook.toJson());
    addBookInUserDb(newBook);
    isPostUploading.value = false;

    successMessage("Product successfully added");
    getAllBooks();
    getUserBook();
    Get.back();
  }

  void addBookInUserDb(ProductData book) async {
    await db
        .collection("userBook")
        .doc(fAuth.currentUser!.uid)
        .collection("Product")
        .add(book.toJson());
  }
}