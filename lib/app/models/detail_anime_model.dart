class DetailAnimeModel {
  String? animeTitle;
  String? type;
  String? releasedDate;
  String? status;
  List<String>? genres;
  String? otherNames;
  String? synopsis;
  String? animeImg;
  String? totalEpisodes;
  List<EpisodesList>? episodesList;

  DetailAnimeModel(
      {this.animeTitle,
      this.type,
      this.releasedDate,
      this.status,
      this.genres,
      this.otherNames,
      this.synopsis,
      this.animeImg,
      this.totalEpisodes,
      this.episodesList});

  DetailAnimeModel.fromJson(Map<String, dynamic> json) {
    animeTitle = json['animeTitle'];
    type = json['type'];
    releasedDate = json['releasedDate'];
    status = json['status'];
    genres = json['genres'].cast<String>();
    otherNames = json['otherNames'];
    synopsis = json['synopsis'];
    animeImg = json['animeImg'];
    totalEpisodes = json['totalEpisodes'];
    if (json['episodesList'] != null) {
      episodesList = <EpisodesList>[];
      json['episodesList'].forEach((v) {
        episodesList!.add(EpisodesList.fromJson(v));
      });
    }
  }
}

class EpisodesList {
  String? episodeId;
  String? episodeNum;
  String? episodeUrl;

  EpisodesList({this.episodeId, this.episodeNum, this.episodeUrl});

  EpisodesList.fromJson(Map<String, dynamic> json) {
    episodeId = json['episodeId'];
    episodeNum = json['episodeNum'];
    episodeUrl = json['episodeUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['episodeId'] = episodeId;
    data['episodeNum'] = episodeNum;
    data['episodeUrl'] = episodeUrl;
    return data;
  }
}
