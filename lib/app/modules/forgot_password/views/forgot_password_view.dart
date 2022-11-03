import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  final ForgotPasswordController _forgotPasswordController =
      ForgotPasswordController();

  ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Forgot Password'),
          centerTitle: true,
        ),
        body: Stack(children: [
          ListView(
            children: [
              Image.asset(
                'assets/images/forgot-password.png',
                width: Get.width,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _forgotPasswordController.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Color(0xFF0B2E58),
                            fontSize: 36,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _forgotPasswordController.email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          } else if (value.isEmail) {
                            return null;
                          }
                          return 'Email not valid';
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: "Email Address",
                            prefixIcon: Icon(
                              Icons.mail_outline,
                              size: 26,
                              color: Color(0xFF0B2E58),
                            ),
                            prefix: Text(
                              "|  ",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFF0B2E58)),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFF0B2E58)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFF0B2E58)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 1,
                        color: Color(0xFF0B2E58),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _forgotPasswordController.formKey.currentState!
                                .validate();
                            _forgotPasswordController.resetPassword();
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF0B2E58)),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 16)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                          child: const Text(
                            "Send",
                            style: TextStyle(color: Colors.white),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ]));
  }
}
