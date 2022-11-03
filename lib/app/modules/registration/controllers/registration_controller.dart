import 'dart:async';

import 'package:anime/app/controllers/firebase_error_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  RxBool obsecureText = true.obs;

  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final FirebaseErrorController _firebaseErrorController =
      FirebaseErrorController();

  Future<void> handleCreateEmailSignIn() async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await credential.user!.sendEmailVerification();
      Get.defaultDialog(
        title: 'Email Verification',
        middleText: 'Check your email, we have sent your email verification.',
        onConfirm: () {
          Get.back();
          Get.back();
        },
      );
    } on FirebaseAuthException catch (e) {
      if (_firebaseErrorController.validationErrors(e.code) != '') {
        Get.defaultDialog(
            title: 'Login Failed',
            middleText: _firebaseErrorController.validationErrors(e.code));
      }
    }
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
