// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:campuskartt/Controller/BookController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BookDetailsHeader extends StatelessWidget {
  final String coverUrl;
  final String title;
  final String author ;
  final String description;
  final String category;
  final String usedFor;
  final String price;
  const BookDetailsHeader({super.key, required this.coverUrl, required this.title, required this.author, required this.description, required this.category, required this.usedFor, required this.price});

  @override
  Widget build(BuildContext context) {
    final BookController bookController = Get.put(BookController());
    return Padding(
      padding: const EdgeInsets.only(top: 8.5),
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Row(
                children: [
                  SizedBox(width: 4),
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 8,
                        offset: Offset(5, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      coverUrl,
                      height: 250,
                      width: 260,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                    
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Seller",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
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
                      SizedBox(
                        width: 4,
                      ),
                      SizedBox(height: 5,),
                      Text(
                        author,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromARGB(255, 0, 0, 0),
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(255, 234, 234, 234),
                              offset: Offset(1, 2),
                              blurRadius:10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    description,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0),
            // Divider(
            //                   height: 1,
            //                   thickness: 2,
            //                   color: Colors.black,
            //                 ),
            //                 SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [

                    
                    
                    Text(
                      "Category",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
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
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Used For",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
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
                    Text(
                      usedFor,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
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
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
