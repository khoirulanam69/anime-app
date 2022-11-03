import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/anime_player_controller.dart';

class AnimePlayerView extends GetView<AnimePlayerController> {
  const AnimePlayerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimePlayerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AnimePlayerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
