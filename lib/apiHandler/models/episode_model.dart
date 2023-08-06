class EpisodesListModel {
  int? total;
  List<EpisodeItem>? list;

  EpisodesListModel({this.total, this.list});

  EpisodesListModel.fromJson(Map<String, dynamic> json) {
    total = json['Total'];
    if (json['List'] != null) {
      list = <EpisodeItem>[];
      json['List'].forEach((v) {
        list!.add(EpisodeItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Total'] = total;
    if (list != null) {
      data['List'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EpisodeItem {
  IDs? iDs;
  String? duration;
  String? resumePosition;
  String? watched;
  int? watchCount;
  bool? isHidden;
  AniDB? aniDB;
  List<TvDB>? tvDB;
  String? name;
  int? size;

  EpisodeItem(
      {this.iDs,
      this.duration,
      this.resumePosition,
      this.watched,
      this.watchCount,
      this.isHidden,
      this.aniDB,
      this.tvDB,
      this.name,
      this.size});

  EpisodeItem.fromJson(Map<String, dynamic> json) {
    iDs = json['IDs'] != null ? IDs.fromJson(json['IDs']) : null;
    duration = json['Duration'];
    resumePosition = json['ResumePosition'];
    watched = json['Watched'];
    watchCount = json['WatchCount'];
    isHidden = json['IsHidden'];
    aniDB = json['AniDB'] != null ? AniDB.fromJson(json['AniDB']) : null;
    if (json['TvDB'] != null) {
      tvDB = <TvDB>[];
      json['TvDB'].forEach((v) {
        tvDB!.add(TvDB.fromJson(v));
      });
    }
    name = json['Name'];
    size = json['Size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (iDs != null) {
      data['IDs'] = iDs!.toJson();
    }
    data['Duration'] = duration;
    data['ResumePosition'] = resumePosition;
    data['Watched'] = watched;
    data['WatchCount'] = watchCount;
    data['IsHidden'] = isHidden;
    if (aniDB != null) {
      data['AniDB'] = aniDB!.toJson();
    }
    if (tvDB != null) {
      data['TvDB'] = tvDB!.map((v) => v.toJson()).toList();
    }
    data['Name'] = name;
    data['Size'] = size;
    return data;
  }
}

class IDs {
  int? aniDB;
  List<int>? tvDB;
  int? iD;

  IDs({this.aniDB, this.tvDB, this.iD});

  IDs.fromJson(Map<String, dynamic> json) {
    aniDB = json['AniDB'];
    tvDB = json['TvDB'].cast<int>();
    iD = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AniDB'] = aniDB;
    data['TvDB'] = tvDB;
    data['ID'] = iD;
    return data;
  }
}

class AniDB {
  int? iD;
  String? type;
  int? episodeNumber;
  String? airDate;
  List<Titles>? titles;
  String? description;
  Rating? rating;

  AniDB(
      {this.iD,
      this.type,
      this.episodeNumber,
      this.airDate,
      this.titles,
      this.description,
      this.rating});

  AniDB.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    type = json['Type'];
    episodeNumber = json['EpisodeNumber'];
    airDate = json['AirDate'];
    if (json['Titles'] != null) {
      titles = <Titles>[];
      json['Titles'].forEach((v) {
        titles!.add(Titles.fromJson(v));
      });
    }
    description = json['Description'];
    rating = json['Rating'] != null ? Rating.fromJson(json['Rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Type'] = type;
    data['EpisodeNumber'] = episodeNumber;
    data['AirDate'] = airDate;
    if (titles != null) {
      data['Titles'] = titles!.map((v) => v.toJson()).toList();
    }
    data['Description'] = description;
    if (rating != null) {
      data['Rating'] = rating!.toJson();
    }
    return data;
  }
}

class Titles {
  String? name;
  String? language;
  String? type;
  bool? primary;
  String? source;

  Titles({this.name, this.language, this.type, this.primary, this.source});

  Titles.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    language = json['Language'];
    type = json['Type'];
    primary = json['Default'];
    source = json['Source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Language'] = language;
    data['Type'] = type;
    data['Default'] = primary;
    data['Source'] = source;
    return data;
  }
}

class Rating {
  double? value;
  int? maxValue;
  String? source;
  int? votes;
  String? type;

  Rating({this.value, this.maxValue, this.source, this.votes, this.type});

  Rating.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
    maxValue = json['MaxValue'];
    source = json['Source'];
    votes = json['Votes'];
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Value'] = value;
    data['MaxValue'] = maxValue;
    data['Source'] = source;
    data['Votes'] = votes;
    data['Type'] = type;
    return data;
  }
}

class TvDB {
  int? iD;
  int? season;
  int? number;
  int? absoluteNumber;
  String? title;
  String? description;
  String? airDate;
  int? airsAfterSeason;
  int? airsBeforeSeason;
  int? airsBeforeEpisode;
  Rating? rating;
  Thumbnail? thumbnail;

  TvDB(
      {this.iD,
      this.season,
      this.number,
      this.absoluteNumber,
      this.title,
      this.description,
      this.airDate,
      this.airsAfterSeason,
      this.airsBeforeSeason,
      this.airsBeforeEpisode,
      this.rating,
      this.thumbnail});

  TvDB.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    season = json['Season'];
    number = json['Number'];
    absoluteNumber = json['AbsoluteNumber'];
    title = json['Title'];
    description = json['Description'];
    airDate = json['AirDate'];
    airsAfterSeason = json['AirsAfterSeason'];
    airsBeforeSeason = json['AirsBeforeSeason'];
    airsBeforeEpisode = json['AirsBeforeEpisode'];
    rating = json['Rating'] != null ? Rating.fromJson(json['Rating']) : null;
    thumbnail = json['Thumbnail'] != null
        ? Thumbnail.fromJson(json['Thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Season'] = season;
    data['Number'] = number;
    data['AbsoluteNumber'] = absoluteNumber;
    data['Title'] = title;
    data['Description'] = description;
    data['AirDate'] = airDate;
    data['AirsAfterSeason'] = airsAfterSeason;
    data['AirsBeforeSeason'] = airsBeforeSeason;
    data['AirsBeforeEpisode'] = airsBeforeEpisode;
    if (rating != null) {
      data['Rating'] = rating!.toJson();
    }
    if (thumbnail != null) {
      data['Thumbnail'] = thumbnail!.toJson();
    }
    return data;
  }
}

class Thumbnail {
  String? source;
  String? type;
  String? iD;
  String? relativeFilepath;
  bool? preferred;
  int? width;
  int? height;
  bool? disabled;

  Thumbnail(
      {this.source,
      this.type,
      this.iD,
      this.relativeFilepath,
      this.preferred,
      this.width,
      this.height,
      this.disabled});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    source = json['Source'];
    type = json['Type'];
    iD = json['ID'];
    relativeFilepath = json['RelativeFilepath'];
    preferred = json['Preferred'];
    width = json['Width'];
    height = json['Height'];
    disabled = json['Disabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Source'] = source;
    data['Type'] = type;
    data['ID'] = iD;
    data['RelativeFilepath'] = relativeFilepath;
    data['Preferred'] = preferred;
    data['Width'] = width;
    data['Height'] = height;
    data['Disabled'] = disabled;
    return data;
  }
}
