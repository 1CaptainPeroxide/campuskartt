import 'package:campuskartt/Config/Message.dart';
import 'package:campuskartt/Pages/HomePage/HomePage.dart';
import 'package:campuskartt/Pages/WelcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final auth = FirebaseAuth.instance;

  void loginWithEmail() async {
    isLoading.value = true;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    try {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credential);

      successMessage('Login Successful');
      Get.offAll(HomePage());


    } catch (ex) {
      print(ex);
      errorMessage('Something went wrong, Try again');
    }
    isLoading.value = false;

    
  }
  void signout() async {
      await auth.signOut();
      successMessage('Logout Successful');
      Get.offAll(WelcomePage());
    }
}
