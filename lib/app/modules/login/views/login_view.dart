import 'package:anime/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LoginController _loginController = LoginController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            'assets/images/login.png',
            width: Get.width,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _loginController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Sign in',
                    style: TextStyle(
                        color: Color(0xFF0B2E58),
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _loginController.email,
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
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFF0B2E58)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFF0B2E58)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Color(0xFF0B2E58)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.red),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() => TextFormField(
                        controller: _loginController.password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        obscureText: _loginController.obsecureText.value,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          hintText: "Password",
                          prefixIcon: const Icon(
                            Icons.key_outlined,
                            size: 26,
                            color: Color(0xFF0B2E58),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _loginController.obsecureText.value =
                                  !_loginController.obsecureText.value;
                            },
                            icon: _loginController.obsecureText.value
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            color: Colors.black54,
                          ),
                          prefix: const Text(
                            "|  ",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xFF0B2E58)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFF0B2E58)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFF0B2E58)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.FORGOT_PASSWORD);
                        },
                        child: const Text(
                          'Forgot password',
                          style: TextStyle(color: Color(0xFF0B2E58)),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    color: Color(0xFF0B2E58),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_loginController.formKey.currentState!.validate()) {
                          _loginController.handleEmailSignIn();
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF0B2E58)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 16)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)))),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _loginController.handleGoogleSignIn();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/google.png'),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('Login with google')
                      ],
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 12)),
                        side: MaterialStateProperty.all(const BorderSide(
                            width: 2, color: Color(0xFF0B2E58))),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text("Don't have account? "),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.REGISTRATION);
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                              color: Color(0xFF0B2E58),
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ]));
  }
}
