import 'package:anime/app/modules/login/controllers/login_controller.dart';
import 'package:anime/app/utils/anime_grid.dart';
import 'package:anime/app/utils/anime_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final LoginController _loginController = LoginController();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('AnimeReo'),
            IconButton(
                onPressed: () {
                  _loginController.logout();
                },
                icon: const Icon(Icons.logout)),
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/banner.jpg',
                      height: 200,
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Image.asset('assets/icons/popular.png'),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'Populer',
                          style: TextStyle(color: Colors.black87),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Image.asset('assets/icons/new.png'),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'Terbaru',
                          style: TextStyle(color: Colors.black87),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Image.asset('assets/icons/rate.png'),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          'Top Rating',
                          style: TextStyle(color: Colors.black87),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Rekomendasi',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                  Container(
                      transform: Matrix4.translationValues(0, -8, 0),
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 0),
                        )
                      ]),
                      child: const AnimeList())
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Untuk kamu',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              AnimeGrid()
            ],
          ),
        ));
  }
}
