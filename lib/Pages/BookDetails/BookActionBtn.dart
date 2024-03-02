import 'package:campuskartt/Controller/BookController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BookActionBtn extends StatelessWidget {

  void _launchWhatsApp(String phoneNumber) async {
    BookController bookController = Get.put(BookController());
    String url = 'https://wa.me/$phoneNumber?text=Hello%20from%20CampusKartt';
    // if (await canLaunch(url)) {
      await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              _launchWhatsApp('918541805152');
            },
            child: Row(
              children: [
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "Assets/Icons/whatsapp.png",
                        height: 35,
                        width: 35,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Chat  ",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.background,
                              letterSpacing: 1.8,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 3,
            height: 30,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          InkWell(
            onTap: () {
              
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 22.0),
              child: Row(
                children: [
                  Image.asset(
                    "Assets/Icons/call.png",
                    height: 35,
                    width: 35,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Phone",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.background,
                          letterSpacing: 1.8,
                        ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


