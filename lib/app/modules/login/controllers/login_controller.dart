import 'dart:async';

import 'package:anime/app/controllers/firebase_error_controller.dart';
import 'package:anime/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  RxBool obsecureText = true.obs;

  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final FirebaseErrorController _firebaseErrorController =
      FirebaseErrorController();

  final GoogleSignIn _googleSignIn =
      GoogleSignIn(signInOption: SignInOption.standard);
  GoogleSignInAccount? _currentUser;

  Future<void> handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn().then((value) => _currentUser = value);
      final _isSignin = await _googleSignIn.isSignedIn();
      if (_isSignin) {
        final userCredential = await _currentUser!.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: userCredential.accessToken,
          idToken: userCredential.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        Get.offAllNamed(Routes.HOME);
      }
    } on FirebaseAuthException catch (e) {
      if (_firebaseErrorController.validationErrors(e.code) != '') {
        Get.defaultDialog(
            title: 'Login Failed',
            middleText: _firebaseErrorController.validationErrors(e.code));
      }
    }
  }

  Future<void> handleEmailSignIn() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text, password: password.text);

      if (userCredential.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
            title: 'Email not Verified',
            middleText: 'Please virify that email, check your email');
      }
    } on FirebaseAuthException catch (e) {
      if (_firebaseErrorController.validationErrors(e.code) != '') {
        Get.defaultDialog(
            title: 'Login Failed',
            middleText: _firebaseErrorController.validationErrors(e.code));
      }
    }
  }

  void logout() async {
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
