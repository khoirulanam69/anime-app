// ignore_for_file: avoid_print

import 'package:anime/app/controllers/firebase_error_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  final FirebaseErrorController _firebaseErrorController =
      FirebaseErrorController();
  void resetPassword() async {
    try {
      // await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      Get.defaultDialog(
        title: "Request forgot password",
        middleText: "We are send link to your email",
        onConfirm: () {
          Get.back();
          Get.back();
        },
      );
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(
          title: "Error",
          middleText: _firebaseErrorController.validationErrors(e.code));
    } catch (e) {
      print(e);
    }
  }
}
