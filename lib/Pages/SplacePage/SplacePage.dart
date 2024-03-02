import 'package:campuskartt/Controller/BookController.dart';
import 'package:campuskartt/Controller/SplaceController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class SplacePage extends StatelessWidget {
  const SplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController =  Get.put(SplaceController());
    BookController bookController = Get.put(BookController());
    return Scaffold(
      body: Container(
        child: Center(
          child: Lottie.asset("Assets/Icons/final2.json"),
          
          
          
        ),
      ),
      
    );
  }
}
