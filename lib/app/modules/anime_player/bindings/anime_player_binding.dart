import 'package:get/get.dart';

import '../controllers/anime_player_controller.dart';

class AnimePlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimePlayerController>(
      () => AnimePlayerController(),
    );
  }
}
