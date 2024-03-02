// ignore_for_file: prefer_const_constructors

import 'package:campuskartt/Components/BookCard.dart';
import 'package:campuskartt/Components/BookTile.dart';
import 'package:campuskartt/Controller/AuthController.dart';
import 'package:campuskartt/Controller/BookController.dart';
import 'package:campuskartt/Pages/BookDetails/BookDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:campuskartt/Models/Data.dart';
import 'package:campuskartt/Pages/HomePage/Widgets/AppBar.dart';
import 'package:campuskartt/Pages/HomePage/Widgets/CategoryWidget.dart';
import 'package:campuskartt/Pages/HomePage/Widgets/MyInputTextfield.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

 

  @override
  Widget build(BuildContext context) {
    final BookController bookController = Get.put(BookController());
    AuthController authController = Get.put(AuthController());
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Theme.of(context).colorScheme.primary,
              height: 450,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 33),
                        HomeAppBar(),
                        Divider(
                          height: 20,
                          thickness: 2,
                          color: Colors.black,
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Hi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "${authController.auth.currentUser!.displayName} 🤓",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(2, 2),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 11),
                        Flexible(
                          child: Text(
                            "Time to declutter and discover! Find great deals, sell your items, and connect with fellow students effortlessly.",
                            style: TextStyle(
                              color: Color.fromARGB(255, 55, 53, 53),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        MyInputTextField(),
                        SizedBox(height: 20),
                        Text(
                          "Categories",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 176, 164, 164),
                                offset: Offset(1, 2),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Flexible(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: categoryData
                                  .map(
                                    (e) => CategoryWidget(
                                      iconPath: e["icon"]!,
                                      btnName: e["lebel"]!,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                          "Trending",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
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
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(() => Row(
                        children: bookController.bookData
                            .map((e) => BookCard(
                                  title: e.title!,
                                  coverUrl: e.coverUrl!,
                                  ontap: () {
                                     Get.to(BookDetails(book: e));
                                  },
                                ))
                            .toList()),)
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                    Text(
                          "Your Interests",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white,
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
                  SizedBox(height: 10),
                 Obx(() =>  Column(
                    children: bookController.bookData
                        .map(
                          (e) => BookTile(
                            ontap: () {
                               Get.to(BookDetails(book: e));
                            },
                            title: e.title!,
                            coverUrl: e.coverUrl!,
                            author: e.author!,
                            price: e.price!,
                            phoneNumber: e.phoneNumber!,
                          ),
                        )
                        .toList(),
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
