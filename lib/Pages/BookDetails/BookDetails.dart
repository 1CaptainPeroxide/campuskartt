// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:campuskartt/Controller/BookController.dart';
import 'package:flutter/material.dart';
import 'package:campuskartt/Config/Colors.dart';
import 'package:campuskartt/Pages/BookDetails/BookActionBtn.dart';
import 'package:campuskartt/Pages/BookDetails/HeaderWidget.dart';
import 'package:campuskartt/Models/BookModel.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetails extends StatelessWidget {
  final ProductData book;
  
  
  const BookDetails({Key? key, required this.book}) : super(key: key);

   

  @override
  Widget build(BuildContext context) {
    final BookController bookController = Get.put(BookController());
    return Scaffold(
      body: ClipRRect(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      color: primaryColor,
                      child: BookDetailsHeader(
                        coverUrl: book.coverUrl!,
                        title: book.title!,
                        author: book.author!,
                        description: book.description!,
                        category: book.category!,
                        usedFor: book.usedFor?? 'Not Given',
                        price: book.price!,
                        
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.all(6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 20, 20, 20),
                                // Shadow color
                                spreadRadius: 2, // Spread radius
                                blurRadius: 3, // Blur radius
                                offset: Offset(0, 2), // Shadow position
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "About Product",
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
                                ],
                              ),
                              SizedBox(height: 0.5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        // border: Border.all(),
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: const Color.fromARGB(
                                        //         255, 122, 128, 122),
                                        //     // Shadow color
                                        //     spreadRadius: 2, // Spread radius
                                        //     blurRadius: 3, // Blur radius
                                        //     offset:
                                        //         Offset(0, 2), // Shadow position
                                        //   ),
                                        // ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Text(
                                          book.description!,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BookActionBtn(),
          ],
        ),
      ),
    );
  }
}
