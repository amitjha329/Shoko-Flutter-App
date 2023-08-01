import 'package:shoko_anime_app/apiHandler/models/series_model.dart';

class GroupModel {
  int? total;
  List<GroupItem>? list;

  GroupModel({this.total, this.list});

  GroupModel.fromJson(Map<String, dynamic> json) {
    total = json['Total'];
    if (json['List'] != null) {
      list = <GroupItem>[];
      json['List'].forEach((v) {
        list!.add(GroupItem.fromJson(v));
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

class GroupItem {
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

  GroupItem(
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

  GroupItem.fromJson(Map<String, dynamic> json) {
    iDs = json['IDs'] != null ? IDs.fromJson(json['IDs']) : null;
    images = json['Images'] != null ? Images.fromJson(json['Images']) : null;
    userRating = json['UserRating'] != null
        ? UserRating.fromJson(json['UserRating'])
        : null;
    airsOn = json['AirsOn']?.cast<int>();
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
