  import 'package:campuskartt/Config/Colors.dart';
import 'package:campuskartt/Pages/ProfilePage/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("Assets/Icons/product-development.png",
                          width: 42,
                          height: 42,),
                          Text("Campus Kart",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.background,
              ),
        ),
                          
                          InkWell(
                            onTap: () {
                              Get.to(ProfilePage());
                            },
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).colorScheme.background,
                              radius: 21,
                              child: Text("M",
                              style: TextStyle(
                                color: primaryColor,
                                
                              ),
                              ),),
                          )
                          
                        ],
                      );
  }
}