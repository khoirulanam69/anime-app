import 'package:get/get.dart';

class FirebaseErrorController extends GetxController {
  String validationErrors(event) {
    if (event == 'account-exists-with-different-credential') {
      return ('Account exist with different credential');
    } else if (event == 'invalid-credential') {
      return ('Credential not valid.');
    } else if (event == 'operation-not-allowed') {
      return ('Operation not allowed');
    } else if (event == 'user-disabled') {
      return ('This email is blocked, please contact administrator.');
    } else if (event == 'user-not-found') {
      return ('No user found for that email, please registration first.');
    } else if (event == 'wrong-password') {
      return ('Wrong password provided for that user. Maybe you are loged in with google.');
    } else if (event == 'invalid-verification-code') {
      return ('Verification code does not match');
    } else if (event == 'invalid-verification-id') {
      return ('Invalid verification id');
    } else if (event == 'email-already-in-use') {
      return ('Email already registered, please login');
    }
    return 'Please contact admin';
  }
}
