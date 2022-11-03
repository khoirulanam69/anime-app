import 'package:anime/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeList extends StatelessWidget {
  const AnimeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Get.toNamed(Routes.ANIME_PLAYER);
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/banner.jpg',
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          title: Text('Anime ' + (index + 1).toString()),
          subtitle: Text('Released : 200' + index.toString()),
          trailing: const Icon(Icons.add_alert_outlined),
        );
      },
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Divider(
            height: 1,
          ),
        );
      },
    );
  }
}
