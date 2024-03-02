import 'package:campuskartt/Components/PrimaryButton.dart';
import 'package:campuskartt/Controller/AuthController.dart';
import 'package:campuskartt/Pages/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController =  Get.put(AuthController());
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 350,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.primary,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Image.asset(
                      "Assets/Images/resell2.png",
                      width: 180,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Campus Kart",
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Theme.of(context).colorScheme.background,
                              ),
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      child: Text(
                        "The ultimate hub for college students to buy and sell second-hand items effortlessly.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.background,
                            ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
               //const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                  ],
                ),
                const SizedBox(height: 60),
                Divider(),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Introducing [Campus Kart] — the go-to platform for college students to buy and sell second-hand items hassle-free. From textbooks to electronics, discover great deals and give unused items a new home. Join our community and revolutionize college commerce today!",
                        textAlign: TextAlign.center,
                        
                        
                        style: Theme.of(context).textTheme.labelLarge ,

                        
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: PrimaryButton(
              btnName: "LOGIN WITH GOOGLE",
              ontap: () {
               authController.loginWithEmail();
                //authController.loginWithEmail();
              },
            ),
          )
        ],
      ),
    );
  }
}