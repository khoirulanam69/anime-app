import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: Get.width * 0.7,
                  height: Get.width * 0.7,
                  child: LottieBuilder.asset('assets/lottie/splash.json')),
              RichText(
                text: const TextSpan(
                  text: 'Anime ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Reo',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Color.fromRGBO(255, 111, 0, 1))),
                  ],
                ),
              )
            ],
          ))),
    );
  }
}
