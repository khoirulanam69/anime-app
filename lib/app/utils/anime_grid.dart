import 'package:anime/app/models/anime_model.dart';
import 'package:anime/app/modules/home/controllers/home_controller.dart';
import 'package:anime/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeGrid extends StatelessWidget {
  final _homeController = Get.put(HomeController(), permanent: true);

  AnimeGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AnimeModel>>(
      stream: _homeController.stateStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 10 / 19,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: _homeController.listAnime.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.ANIME_PLAYER);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      _homeController.listAnime[index].animeImg.toString(),
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      _homeController.listAnime[index].animeTitle.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Release : ' +
                          _homeController.listAnime[index].releasedDate
                              .toString(),
                      style: const TextStyle(color: Colors.black54),
                    )
                  ],
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
