import 'package:campuskartt/Controller/BookController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyInputTextField extends StatelessWidget {
  const MyInputTextField({Key? key});

  @override
  Widget build(BuildContext context) {
     BookController bookController = Get.put(BookController());
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15), // Adjust padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const SizedBox(width: 4), // Adjust width
          InkWell(
            onTap: () {
              bookController.getAllBooks();
            },
            child: Image.asset(
              "Assets/Icons/search.png",
              height: 20, // Adjust height
              width: 20, // Adjust width
            ),
          ),
          const SizedBox(width: 8), // Adjust width
          Expanded(
            child: TextFormField(
              style: TextStyle(fontSize: 17), // Adjust font size
              decoration: InputDecoration(
                hintText: "Search products . .",
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero, // Remove default content padding
              ),
            ),
          ),
        ],
      ),
    );
  }
}
