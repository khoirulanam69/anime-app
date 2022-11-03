class AnimeModel {
  String? animeId;
  String? animeTitle;
  String? animeImg;
  String? releasedDate;
  String? animeUrl;

  AnimeModel(
      {this.animeId,
      this.animeTitle,
      this.animeImg,
      this.releasedDate,
      this.animeUrl});

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
        animeId: json['animeId'],
        animeTitle: json['animeTitle'],
        animeImg: json['animeImg'],
        releasedDate: json['releasedDate'],
        animeUrl: json['animeUrl']);
  }
}
