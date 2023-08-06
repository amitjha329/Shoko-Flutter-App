class SeriesListModel {
  int? total;
  List<SeriesItem>? list;

  SeriesListModel({this.total, this.list});

  SeriesListModel.fromJson(Map<String, dynamic> json) {
    total = json['Total'];
    if (json['List'] != null) {
      list = <SeriesItem>[];
      json['List'].forEach((v) {
        list!.add(SeriesItem.fromJson(v));
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

class SeriesItem {
  IDs? iDs;
  Images? images;
  UserRating? userRating;
  List<int>? airsOn;
  List<Links>? links;
  Sizes? sizes;
  String? created;
  String? updated;
  AniDB? aniDB;
  List<TvDB>? tvDB;
  String? name;
  int? size;

  SeriesItem(
      {this.iDs,
      this.images,
      this.userRating,
      this.airsOn,
      this.links,
      this.sizes,
      this.created,
      this.updated,
      this.aniDB,
      this.tvDB,
      this.name,
      this.size});

  SeriesItem.fromJson(Map<String, dynamic> json) {
    iDs = json['IDs'] != null ? IDs.fromJson(json['IDs']) : null;
    images = json['Images'] != null ? Images.fromJson(json['Images']) : null;
    userRating = json['UserRating'] != null
        ? UserRating.fromJson(json['UserRating'])
        : null;
    airsOn = json['AirsOn'].cast<int>();
    if (json['Links'] != null) {
      links = <Links>[];
      json['Links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    sizes = json['Sizes'] != null ? Sizes.fromJson(json['Sizes']) : null;
    created = json['Created'];
    updated = json['Updated'];
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
    if (images != null) {
      data['Images'] = images!.toJson();
    }
    if (userRating != null) {
      data['UserRating'] = userRating!.toJson();
    }
    data['AirsOn'] = airsOn;
    if (links != null) {
      data['Links'] = links!.map((v) => v.toJson()).toList();
    }
    if (sizes != null) {
      data['Sizes'] = sizes!.toJson();
    }
    data['Created'] = created;
    data['Updated'] = updated;
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
  int? parentGroup;
  int? topLevelGroup;
  int? aniDB;
  List<int>? tvDB;
  List<int>? tMDB;
  List<int>? mAL;
  List<String>? traktTv;
  List<int>? aniList;
  int? iD;

  IDs(
      {this.parentGroup,
      this.topLevelGroup,
      this.aniDB,
      this.tvDB,
      this.tMDB,
      this.mAL,
      this.traktTv,
      this.aniList,
      this.iD});

  IDs.fromJson(Map<String, dynamic> json) {
    parentGroup = json['ParentGroup'];
    topLevelGroup = json['TopLevelGroup'];
    aniDB = json['AniDB'];
    tvDB = json['TvDB'].cast<int>();
    tMDB = json['TMDB'].cast<int>();
    mAL = json['MAL'].cast<int>();
    traktTv = json['TraktTv'].cast<String>();
    aniList = json['AniList'].cast<int>();
    iD = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ParentGroup'] = parentGroup;
    data['TopLevelGroup'] = topLevelGroup;
    data['AniDB'] = aniDB;
    data['TvDB'] = tvDB;
    data['TMDB'] = tMDB;
    data['MAL'] = mAL;
    data['TraktTv'] = traktTv;
    data['AniList'] = aniList;
    data['ID'] = iD;
    return data;
  }
}

class Images {
  List<PostersFanArtsBanners>? posters;
  List<PostersFanArtsBanners>? fanarts;
  List<PostersFanArtsBanners>? banners;

  Images({this.posters, this.fanarts, this.banners});

  Images.fromJson(Map<String, dynamic> json) {
    if (json['Posters'] != null) {
      posters = <PostersFanArtsBanners>[];
      json['Posters'].forEach((v) {
        posters!.add(PostersFanArtsBanners.fromJson(v));
      });
    }
    if (json['Fanarts'] != null) {
      fanarts = <PostersFanArtsBanners>[];
      json['Fanarts'].forEach((v) {
        fanarts!.add(PostersFanArtsBanners.fromJson(v));
      });
    }
    if (json['Banners'] != null) {
      banners = <PostersFanArtsBanners>[];
      json['Banners'].forEach((v) {
        banners!.add(PostersFanArtsBanners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (posters != null) {
      data['Posters'] = posters!.map((v) => v.toJson()).toList();
    }
    if (fanarts != null) {
      data['Fanarts'] = fanarts!.map((v) => v.toJson()).toList();
    }
    if (banners != null) {
      data['Banners'] = banners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostersFanArtsBanners {
  String? source;
  String? type;
  String? iD;
  String? relativeFilepath;
  bool? preferred;
  int? width;
  int? height;
  bool? disabled;

  PostersFanArtsBanners(
      {this.source,
      this.type,
      this.iD,
      this.relativeFilepath,
      this.preferred,
      this.width,
      this.height,
      this.disabled});

  PostersFanArtsBanners.fromJson(Map<String, dynamic> json) {
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

class UserRating {
  double? value;
  int? maxValue;
  String? source;
  int? votes;
  String? type;

  UserRating({this.value, this.maxValue, this.source, this.votes, this.type});

  UserRating.fromJson(Map<String, dynamic> json) {
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

class Links {
  String? type;
  String? name;
  String? uRL;

  Links({this.type, this.name, this.uRL});

  Links.fromJson(Map<String, dynamic> json) {
    type = json['Type'];
    name = json['Name'];
    uRL = json['URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Type'] = type;
    data['Name'] = name;
    data['URL'] = uRL;
    return data;
  }
}

class Sizes {
  int? missing;
  int? hidden;
  FileSources? fileSources;
  Local? local;
  Local? watched;
  Local? total;

  Sizes(
      {this.missing,
      this.hidden,
      this.fileSources,
      this.local,
      this.watched,
      this.total});

  Sizes.fromJson(Map<String, dynamic> json) {
    missing = json['Missing'];
    hidden = json['Hidden'];
    fileSources = json['FileSources'] != null
        ? FileSources.fromJson(json['FileSources'])
        : null;
    local = json['Local'] != null ? Local.fromJson(json['Local']) : null;
    watched = json['Watched'] != null ? Local.fromJson(json['Watched']) : null;
    total = json['Total'] != null ? Local.fromJson(json['Total']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Missing'] = missing;
    data['Hidden'] = hidden;
    if (fileSources != null) {
      data['FileSources'] = fileSources!.toJson();
    }
    if (local != null) {
      data['Local'] = local!.toJson();
    }
    if (watched != null) {
      data['Watched'] = watched!.toJson();
    }
    if (total != null) {
      data['Total'] = total!.toJson();
    }
    return data;
  }
}

class FileSources {
  int? unknown;
  int? other;
  int? tV;
  int? dVD;
  int? bluRay;
  int? web;
  int? vHS;
  int? vCD;
  int? laserDisc;
  int? camera;

  FileSources(
      {this.unknown,
      this.other,
      this.tV,
      this.dVD,
      this.bluRay,
      this.web,
      this.vHS,
      this.vCD,
      this.laserDisc,
      this.camera});

  FileSources.fromJson(Map<String, dynamic> json) {
    unknown = json['Unknown'];
    other = json['Other'];
    tV = json['TV'];
    dVD = json['DVD'];
    bluRay = json['BluRay'];
    web = json['Web'];
    vHS = json['VHS'];
    vCD = json['VCD'];
    laserDisc = json['LaserDisc'];
    camera = json['Camera'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Unknown'] = unknown;
    data['Other'] = other;
    data['TV'] = tV;
    data['DVD'] = dVD;
    data['BluRay'] = bluRay;
    data['Web'] = web;
    data['VHS'] = vHS;
    data['VCD'] = vCD;
    data['LaserDisc'] = laserDisc;
    data['Camera'] = camera;
    return data;
  }
}

class Local {
  int? unknown;
  int? episodes;
  int? specials;
  int? credits;
  int? trailers;
  int? parodies;
  int? others;

  Local(
      {this.unknown,
      this.episodes,
      this.specials,
      this.credits,
      this.trailers,
      this.parodies,
      this.others});

  Local.fromJson(Map<String, dynamic> json) {
    unknown = json['Unknown'];
    episodes = json['Episodes'];
    specials = json['Specials'];
    credits = json['Credits'];
    trailers = json['Trailers'];
    parodies = json['Parodies'];
    others = json['Others'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Unknown'] = unknown;
    data['Episodes'] = episodes;
    data['Specials'] = specials;
    data['Credits'] = credits;
    data['Trailers'] = trailers;
    data['Parodies'] = parodies;
    data['Others'] = others;
    return data;
  }
}

class AniDB {
  String? airDate;
  String? endDate;
  int? iD;
  int? shokoID;
  String? type;
  String? title;
  List<Titles>? titles;
  String? description;
  bool? restricted;
  PostersFanArtsBanners? poster;
  int? episodeCount;
  UserRating? rating;
  UserRating? userApproval;
  int? relation;

  AniDB(
      {this.airDate,
      this.endDate,
      this.iD,
      this.shokoID,
      this.type,
      this.title,
      this.titles,
      this.description,
      this.restricted,
      this.poster,
      this.episodeCount,
      this.rating,
      this.userApproval,
      this.relation});

  AniDB.fromJson(Map<String, dynamic> json) {
    airDate = json['AirDate'];
    endDate = json['EndDate'];
    iD = json['ID'];
    shokoID = json['ShokoID'];
    type = json['Type'];
    title = json['Title'];
    if (json['Titles'] != null) {
      titles = <Titles>[];
      json['Titles'].forEach((v) {
        titles!.add(Titles.fromJson(v));
      });
    }
    description = json['Description'];
    restricted = json['Restricted'];
    poster = json['Poster'] != null
        ? PostersFanArtsBanners.fromJson(json['Poster'])
        : null;
    episodeCount = json['EpisodeCount'];
    rating =
        json['Rating'] != null ? UserRating.fromJson(json['Rating']) : null;
    userApproval = json['UserApproval'] != null
        ? UserRating.fromJson(json['UserApproval'])
        : null;
    relation = json['Relation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AirDate'] = airDate;
    data['EndDate'] = endDate;
    data['ID'] = iD;
    data['ShokoID'] = shokoID;
    data['Type'] = type;
    data['Title'] = title;
    if (titles != null) {
      data['Titles'] = titles!.map((v) => v.toJson()).toList();
    }
    data['Description'] = description;
    data['Restricted'] = restricted;
    if (poster != null) {
      data['Poster'] = poster!.toJson();
    }
    data['EpisodeCount'] = episodeCount;
    if (rating != null) {
      data['Rating'] = rating!.toJson();
    }
    if (userApproval != null) {
      data['UserApproval'] = userApproval!.toJson();
    }
    data['Relation'] = relation;
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

class TvDB {
  int? iD;
  String? airDate;
  String? endDate;
  String? title;
  String? description;
  int? season;
  List<PostersFanArtsBanners>? posters;
  List<PostersFanArtsBanners>? fanarts;
  List<PostersFanArtsBanners>? banners;
  UserRating? rating;

  TvDB(
      {this.iD,
      this.airDate,
      this.endDate,
      this.title,
      this.description,
      this.season,
      this.posters,
      this.fanarts,
      this.banners,
      this.rating});

  TvDB.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    airDate = json['AirDate'];
    endDate = json['EndDate'];
    title = json['Title'];
    description = json['Description'];
    season = json['Season'];
    if (json['Posters'] != null) {
      posters = <PostersFanArtsBanners>[];
      json['Posters'].forEach((v) {
        posters!.add(PostersFanArtsBanners.fromJson(v));
      });
    }
    if (json['Fanarts'] != null) {
      fanarts = <PostersFanArtsBanners>[];
      json['Fanarts'].forEach((v) {
        fanarts!.add(PostersFanArtsBanners.fromJson(v));
      });
    }
    if (json['Banners'] != null) {
      banners = <PostersFanArtsBanners>[];
      json['Banners'].forEach((v) {
        banners!.add(PostersFanArtsBanners.fromJson(v));
      });
    }
    rating =
        json['Rating'] != null ? UserRating.fromJson(json['Rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['AirDate'] = airDate;
    data['EndDate'] = endDate;
    data['Title'] = title;
    data['Description'] = description;
    data['Season'] = season;
    if (posters != null) {
      data['Posters'] = posters!.map((v) => v.toJson()).toList();
    }
    if (fanarts != null) {
      data['Fanarts'] = fanarts!.map((v) => v.toJson()).toList();
    }
    if (banners != null) {
      data['Banners'] = banners!.map((v) => v.toJson()).toList();
    }
    if (rating != null) {
      data['Rating'] = rating!.toJson();
    }
    return data;
  }
}
