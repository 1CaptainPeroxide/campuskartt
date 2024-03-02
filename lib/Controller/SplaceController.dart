import 'package:campuskartt/Pages/HomePage/HomePage.dart';
import 'package:campuskartt/Pages/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
class SplaceController extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    splaceController();
    super.onInit();
  }
      
      void splaceController() {
        Future.delayed(Duration(seconds: 3), () {

          if(auth.currentUser != null) {
            Get.offAll(HomePage());
          }
          else{
          Get.offAll(WelcomePage());
          }
        });
      }
}

