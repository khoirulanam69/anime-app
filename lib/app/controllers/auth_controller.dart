// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var isLogedIn = false.obs;

  final GoogleSignIn _googleSignIn =
      GoogleSignIn(signInOption: SignInOption.standard);

  Future<void> intialState() async {
    try {
      var isSignin = await _googleSignIn.isSignedIn();
      if (isSignin) {
        isLogedIn.value = true;
      } else {
        isLogedIn.value = false;
      }
    } catch (e) {
      print(e);
    }
  }
}
