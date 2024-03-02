import 'package:campuskartt/Components/BookTile.dart';
import 'package:campuskartt/Components/MultiLineTextField.dart';
import 'package:campuskartt/Components/MyTextFormField.dart';
import 'package:campuskartt/Config/Colors.dart';
import 'package:campuskartt/Controller/BookController.dart';
import 'package:campuskartt/Models/Data.dart';
import 'package:campuskartt/Pages/BookDetails/BookDetails.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddNewBookPage extends StatelessWidget {
  const AddNewBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    BookController bookcontroller = Get.put(BookController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Theme.of(context).colorScheme.primary,
              height: 340,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 33),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    "Assets/Icons/backbtn.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                  SizedBox(width: 4),
                                  // Text(
                                  //   "Back",
                                  //   style: TextStyle(
                                  //     fontWeight: FontWeight.bold,
                                  //     fontSize: 18,
                                  //     color: Colors.black,
                                  //     shadows: [
                                  //       Shadow(
                                  //         color: const Color.fromARGB(255, 167, 155, 155),
                                  //         offset: Offset(1, 2),
                                  //         blurRadius: 3,
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: 55,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset("Assets/Images/add-file.png",
                                width: 35, height: 35),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Add New Product",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 20,
                          thickness: 2,
                          color: Colors.black,
                        ),
                        SizedBox(height: 23),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  bookcontroller.pickImage();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 8,
                                        offset: Offset(5, 3),
                                      ),
                                    ],
                                  ),
                                  child: Obx(
                                    () => Container(
                                      height: 190,
                                      width: 150,
                                      child: Center(
                                        child: bookcontroller
                                                .isImageUploading.value
                                            ? CircularProgressIndicator(
                                                color: primaryColor,
                                              )
                                            : bookcontroller.imageUrl.value ==
                                                    ""
                                                ? Image.asset(
                                                    "Assets/Icons/image.png")
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 5, 0, 5),
                                                      child: Image.network(
                                                        bookcontroller
                                                            .imageUrl.value,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    )),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // Container(
            //   width: 200,
            //   height: 50,
            //   padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
            //   decoration: BoxDecoration(
            //     color: primaryColor,
            //     borderRadius: BorderRadius.circular(37),
            //   ),
            //   child:
            //       Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //     Icon(
            //       Icons.upload_sharp,
            //       color: Colors.white,
            //     ),
            //     SizedBox(width: 8),
            //     Text(
            //       "Upload Photo",
            //       style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            //             color: Colors.black,
            //           ),
            //     ),
            //   ]),
            // ),
            SizedBox(
              height: 6,
            ),
            MyTextFormField(
                hintText: "Title",
                icon: Icons.title,
                controller: bookcontroller.title),
            SizedBox(height: 10),
            MultiLineTextFormField(
                hintText: "Description",
                icon: Icons.description,
                controller: bookcontroller.description),
            SizedBox(height: 10),
            MyTextFormField(
                hintText: "Author",
                icon: Icons.person,
                controller: bookcontroller.author),
            SizedBox(height: 10),
            MyTextFormField(
                hintText: "Category",
                icon: Icons.category,
                controller: bookcontroller.category),
            MyTextFormField(
                hintText: "Phone Number",
                icon: Icons.call,
                controller: bookcontroller.phoneNumber),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: MyTextFormField(
                      hintText: "Used for",
                      icon: Icons.data_usage_rounded,
                      controller: bookcontroller.usedFor),
                ),
                Expanded(
                  child: MyTextFormField(
                      hintText: "Price",
                      icon: Icons.currency_rupee,
                      controller: bookcontroller.price),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 200,
                    height: 50,
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 216, 211, 211),
                      borderRadius: BorderRadius.circular(37),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "CANCEL",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    width: 200,
                    height: 50,
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(37),
                    ),
                    child: InkWell(
                      onTap: () {
                        bookcontroller.createBook();
                      },
                      child: bookcontroller.isPostUploading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  Icon(
                                    Icons.upload_sharp,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 14),
                                  Text(
                                    "POST",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                ]),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
