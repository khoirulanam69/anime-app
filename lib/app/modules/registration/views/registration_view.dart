import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  final RegistrationController _registrationController =
      RegistrationController();

  RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registration'),
          centerTitle: true,
        ),
        body: Stack(children: [
          ListView(
            children: [
              Image.asset(
                'assets/images/registration.png',
                width: Get.width,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _registrationController.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Color(0xFF0B2E58),
                            fontSize: 36,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _registrationController.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                            hintText: "Full Name",
                            prefixIcon: Icon(
                              Icons.person_outline_outlined,
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
                      TextFormField(
                        controller: _registrationController.email,
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
                      Obx(() => TextFormField(
                            controller: _registrationController.password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              } else if (value.length < 8) {
                                return 'The password provided is too weak';
                              } else if (!value.contains(RegExp(r'[A-Z]'))) {
                                return 'Must have at least 1 uppercase character';
                              } else if (!value.contains(RegExp(r'[0-9]'))) {
                                return 'Must have at least 1 number character';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            obscureText:
                                _registrationController.obsecureText.value,
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
                                  _registrationController.obsecureText.value =
                                      !_registrationController
                                          .obsecureText.value;
                                },
                                icon: _registrationController.obsecureText.value
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
                      const Divider(
                        color: Color(0xFF0B2E58),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_registrationController.formKey.currentState!
                                .validate()) {
                              _registrationController.handleCreateEmailSignIn();
                            }
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
                            "Register",
                            style: TextStyle(color: Colors.white),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ]));
  }
}
