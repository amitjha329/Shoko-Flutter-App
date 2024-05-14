import 'dart:convert';

class SeriesListModelNew {
  int? total;
  List<SeriesItemNew>? list;

  SeriesListModelNew({
    this.total,
    this.list,
  });

  factory SeriesListModelNew.fromRawJson(String str) =>
      SeriesListModelNew.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SeriesListModelNew.fromJson(Map<String, dynamic> json) =>
      SeriesListModelNew(
        total: json["Total"],
        list: json["List"] == null
            ? []
            : List<SeriesItemNew>.from(
                json["List"]!.map((x) => SeriesItemNew.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Total": total,
        "List": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class SeriesItemNew {
  IDs? iDs;
  Images? images;
  dynamic userRating;
  List<String>? airsOn;
  List<Link>? links;
  Sizes? sizes;
  DateTime? created;
  DateTime? updated;
  String? name;
  int? size;

  SeriesItemNew({
    this.iDs,
    this.images,
    this.userRating,
    this.airsOn,
    this.links,
    this.sizes,
    this.created,
    this.updated,
    this.name,
    this.size,
  });

  factory SeriesItemNew.fromRawJson(String str) =>
      SeriesItemNew.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SeriesItemNew.fromJson(Map<String, dynamic> json) => SeriesItemNew(
        iDs: json["IDs"] == null ? null : IDs.fromJson(json["IDs"]),
        images: json["Images"] == null ? null : Images.fromJson(json["Images"]),
        userRating: json["UserRating"],
        airsOn: json["AirsOn"] == null
            ? []
            : List<String>.from(json["AirsOn"]!.map((x) => x)),
        links: json["Links"] == null
            ? []
            : List<Link>.from(json["Links"]!.map((x) => Link.fromJson(x))),
        sizes: json["Sizes"] == null ? null : Sizes.fromJson(json["Sizes"]),
        created:
            json["Created"] == null ? null : DateTime.parse(json["Created"]),
        updated:
            json["Updated"] == null ? null : DateTime.parse(json["Updated"]),
        name: json["Name"],
        size: json["Size"],
      );

  Map<String, dynamic> toJson() => {
        "IDs": iDs?.toJson(),
        "Images": images?.toJson(),
        "UserRating": userRating,
        "AirsOn":
            airsOn == null ? [] : List<dynamic>.from(airsOn!.map((x) => x)),
        "Links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "Sizes": sizes?.toJson(),
        "Created": created?.toIso8601String(),
        "Updated": updated?.toIso8601String(),
        "Name": name,
        "Size": size,
      };
}

class IDs {
  int? parentGroup;
  int? topLevelGroup;
  int? aniDb;
  List<dynamic>? tvDb;
  List<dynamic>? tmdb;
  List<int>? mal;
  List<dynamic>? traktTv;
  List<dynamic>? aniList;
  int? id;

  IDs({
    this.parentGroup,
    this.topLevelGroup,
    this.aniDb,
    this.tvDb,
    this.tmdb,
    this.mal,
    this.traktTv,
    this.aniList,
    this.id,
  });

  factory IDs.fromRawJson(String str) => IDs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IDs.fromJson(Map<String, dynamic> json) => IDs(
        parentGroup: json["ParentGroup"],
        topLevelGroup: json["TopLevelGroup"],
        aniDb: json["AniDB"],
        tvDb: json["TvDB"] == null
            ? []
            : List<dynamic>.from(json["TvDB"]!.map((x) => x)),
        tmdb: json["TMDB"] == null
            ? []
            : List<dynamic>.from(json["TMDB"]!.map((x) => x)),
        mal: json["MAL"] == null
            ? []
            : List<int>.from(json["MAL"]!.map((x) => x)),
        traktTv: json["TraktTv"] == null
            ? []
            : List<dynamic>.from(json["TraktTv"]!.map((x) => x)),
        aniList: json["AniList"] == null
            ? []
            : List<dynamic>.from(json["AniList"]!.map((x) => x)),
        id: json["ID"],
      );

  Map<String, dynamic> toJson() => {
        "ParentGroup": parentGroup,
        "TopLevelGroup": topLevelGroup,
        "AniDB": aniDb,
        "TvDB": tvDb == null ? [] : List<dynamic>.from(tvDb!.map((x) => x)),
        "TMDB": tmdb == null ? [] : List<dynamic>.from(tmdb!.map((x) => x)),
        "MAL": mal == null ? [] : List<dynamic>.from(mal!.map((x) => x)),
        "TraktTv":
            traktTv == null ? [] : List<dynamic>.from(traktTv!.map((x) => x)),
        "AniList":
            aniList == null ? [] : List<dynamic>.from(aniList!.map((x) => x)),
        "ID": id,
      };
}

class Images {
  List<Poster>? posters;
  List<dynamic>? fanarts;
  List<dynamic>? banners;

  Images({
    this.posters,
    this.fanarts,
    this.banners,
  });

  factory Images.fromRawJson(String str) => Images.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        posters: json["Posters"] == null
            ? []
            : List<Poster>.from(
                json["Posters"]!.map((x) => Poster.fromJson(x))),
        fanarts: json["Fanarts"] == null
            ? []
            : List<dynamic>.from(json["Fanarts"]!.map((x) => x)),
        banners: json["Banners"] == null
            ? []
            : List<dynamic>.from(json["Banners"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Posters": posters == null
            ? []
            : List<dynamic>.from(posters!.map((x) => x.toJson())),
        "Fanarts":
            fanarts == null ? [] : List<dynamic>.from(fanarts!.map((x) => x)),
        "Banners":
            banners == null ? [] : List<dynamic>.from(banners!.map((x) => x)),
      };
}

class Poster {
  String? source;
  String? type;
  String? id;
  String? relativeFilepath;
  bool? preferred;
  dynamic width;
  dynamic height;
  bool? disabled;

  Poster({
    this.source,
    this.type,
    this.id,
    this.relativeFilepath,
    this.preferred,
    this.width,
    this.height,
    this.disabled,
  });

  factory Poster.fromRawJson(String str) => Poster.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Poster.fromJson(Map<String, dynamic> json) => Poster(
        source: json["Source"],
        type: json["Type"],
        id: json["ID"],
        relativeFilepath: json["RelativeFilepath"],
        preferred: json["Preferred"],
        width: json["Width"],
        height: json["Height"],
        disabled: json["Disabled"],
      );

  Map<String, dynamic> toJson() => {
        "Source": source,
        "Type": type,
        "ID": id,
        "RelativeFilepath": relativeFilepath,
        "Preferred": preferred,
        "Width": width,
        "Height": height,
        "Disabled": disabled,
      };
}

class Link {
  String? type;
  String? name;
  String? url;

  Link({
    this.type,
    this.name,
    this.url,
  });

  factory Link.fromRawJson(String str) => Link.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        type: json["Type"],
        name: json["Name"],
        url: json["URL"],
      );

  Map<String, dynamic> toJson() => {
        "Type": type,
        "Name": name,
        "URL": url,
      };
}

class Sizes {
  int? hidden;
  Map<String, int>? fileSources;
  Local? local;
  Local? watched;
  Missing? missing;
  Local? total;

  Sizes({
    this.hidden,
    this.fileSources,
    this.local,
    this.watched,
    this.missing,
    this.total,
  });

  factory Sizes.fromRawJson(String str) => Sizes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        hidden: json["Hidden"],
        fileSources: Map.from(json["FileSources"]!)
            .map((k, v) => MapEntry<String, int>(k, v)),
        local: json["Local"] == null ? null : Local.fromJson(json["Local"]),
        watched:
            json["Watched"] == null ? null : Local.fromJson(json["Watched"]),
        missing:
            json["Missing"] == null ? null : Missing.fromJson(json["Missing"]),
        total: json["Total"] == null ? null : Local.fromJson(json["Total"]),
      );

  Map<String, dynamic> toJson() => {
        "Hidden": hidden,
        "FileSources": Map.from(fileSources!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "Local": local?.toJson(),
        "Watched": watched?.toJson(),
        "Missing": missing?.toJson(),
        "Total": total?.toJson(),
      };
}

class Local {
  int? unknown;
  int? episodes;
  int? specials;
  int? credits;
  int? trailers;
  int? parodies;
  int? others;

  Local({
    this.unknown,
    this.episodes,
    this.specials,
    this.credits,
    this.trailers,
    this.parodies,
    this.others,
  });

  factory Local.fromRawJson(String str) => Local.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Local.fromJson(Map<String, dynamic> json) => Local(
        unknown: json["Unknown"],
        episodes: json["Episodes"],
        specials: json["Specials"],
        credits: json["Credits"],
        trailers: json["Trailers"],
        parodies: json["Parodies"],
        others: json["Others"],
      );

  Map<String, dynamic> toJson() => {
        "Unknown": unknown,
        "Episodes": episodes,
        "Specials": specials,
        "Credits": credits,
        "Trailers": trailers,
        "Parodies": parodies,
        "Others": others,
      };
}

class Missing {
  int? episodes;
  int? specials;

  Missing({
    this.episodes,
    this.specials,
  });

  factory Missing.fromRawJson(String str) => Missing.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Missing.fromJson(Map<String, dynamic> json) => Missing(
        episodes: json["Episodes"],
        specials: json["Specials"],
      );

  Map<String, dynamic> toJson() => {
        "Episodes": episodes,
        "Specials": specials,
      };
}
