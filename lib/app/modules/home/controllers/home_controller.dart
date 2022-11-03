import 'dart:async';
import 'dart:convert';

import 'package:anime/app/models/anime_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  List<AnimeModel> listAnime = <AnimeModel>[].obs;

  final StreamController _eventController = StreamController();
  StreamSink get eventSink => _eventController.sink;
  final StreamController<List<AnimeModel>> _stateController =
      StreamController<List<AnimeModel>>();
  StreamSink<List<AnimeModel>> get stateSink => _stateController.sink;
  Stream<List<AnimeModel>> get stateStream => _stateController.stream;

  HomeController() {
    _eventController.stream.listen((event) {
      getAnimeFromUrl();
    });
  }

  @override
  void onInit() {
    getAnimeFromUrl();
    super.onInit();
  }

  void getAnimeFromUrl() async {
    final response =
        await http.get(Uri.parse('https://gogoanime.consumet.org/popular'));
    if (response.statusCode == 200) {
      Iterable it = jsonDecode(response.body);
      listAnime = it.map((e) => AnimeModel.fromJson(e)).toList();
      stateSink.add(listAnime);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void onClose() {
    _eventController.close();
    _stateController.close();
    super.onClose();
  }
}
