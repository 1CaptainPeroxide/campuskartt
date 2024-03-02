import 'package:campuskartt/Controller/AuthController.dart';
import 'package:campuskartt/Controller/BookController.dart';
import 'package:campuskartt/Pages/AddNewBook/AddNewBook.dart';
import 'package:campuskartt/Pages/BookDetails/BookDetails.dart';
import 'package:flutter/material.dart';
import 'package:campuskartt/Components/BookTile.dart';
import 'package:campuskartt/Components/PrimaryButton.dart';
import 'package:campuskartt/Models/Data.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {

    AuthController authController = Get.put(AuthController());
    BookController bookController = Get.put(BookController());
    bookController.getUserBook();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddNewBookPage());
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(33.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    color: Theme.of(context).colorScheme.primary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 80),
                        Container(
                          padding: EdgeInsets.all(6.2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 3,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          child: Container(
                            width: 135,
                            height: 135,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "Assets/Icons/man.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "${authController.auth.currentUser!.displayName}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.8,
                            color: Color.fromARGB(255, 0, 0, 0),
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 234, 234, 234),
                                offset: Offset(1, 2),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "${authController.auth.currentUser!.email}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                offset: Offset(1, 1),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Products",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                offset: Offset(1, 2),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Obx(() => Column(
                          children: bookController.currentUserBooks
                              .map(
                                (e) => BookTile(
                                  title: e.title!,
                                  coverUrl: e.coverUrl!,
                                  author: e.author!,
                                  price: e.price!,
                                  phoneNumber: e.phoneNumber!,
                                  ontap: () {
                                    Get.to(BookDetails(book: e));
                                  },
                                ),
                              )
                              .toList(),
                        ),),
                        SizedBox(height: 60),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: InkWell(
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
                    Text(
                      "Back",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            color: const Color.fromARGB(255, 167, 155, 155),
                            offset: Offset(1, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 38.0,
              left: MediaQuery.of(context).size.width / 2 - 35, // Adjust as needed
              child: Text(
                "Profile",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 25,
                    ),
              ),
            ),
            
            Positioned(
              height: 20,
              top: 38,
              left: MediaQuery.of(context).size.width / 2 - -133,
              child: IconButton(onPressed: () {
                authController.signout();
              }, icon: Icon(Icons.logout,size:27,
              color: Theme.of(context).colorScheme.background,
              ))),
          ],
        ),
      ),
    );
  }
}
