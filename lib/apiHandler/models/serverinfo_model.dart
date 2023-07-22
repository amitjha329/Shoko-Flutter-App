class ServerInfoModel {
  ServerMeta? server;
  ServerMeta? commons;
  ServerMeta? models;
  ServerMeta? mediaInfo;
  ServerMeta? webUI;

  ServerInfoModel(
      {this.server, this.commons, this.models, this.mediaInfo, this.webUI});

  ServerInfoModel.fromJson(Map<String, dynamic> json)
      : server =
            json['Server'] != null ? ServerMeta.fromJson(json['Server']) : null,
        commons = json['Commons'] != null
            ? ServerMeta.fromJson(json['Commons'])
            : null,
        models =
            json['Models'] != null ? ServerMeta.fromJson(json['Models']) : null,
        mediaInfo = json['MediaInfo'] != null
            ? ServerMeta.fromJson(json['MediaInfo'])
            : null,
        webUI =
            json['WebUI'] != null ? ServerMeta.fromJson(json['WebUI']) : null;

  Map<String, dynamic> toJson() => {
        'Server': server!.toJson(),
        'Commons': commons!.toJson(),
        'Models': models!.toJson(),
        'MediaInfo': mediaInfo!.toJson(),
        'WebUI': webUI!.toJson()
      };
}

class ServerMeta {
  String? version;
  String? commit;
  String? releaseChannel;
  String? releaseDate;
  String? tag;
  String? description;

  ServerMeta(
      {this.version,
      this.commit,
      this.releaseChannel,
      this.releaseDate,
      this.tag,
      this.description});

  ServerMeta.fromJson(Map<String, dynamic> json)
      : version = json['Version'],
        commit = json['Commit'],
        releaseChannel = json['ReleaseChannel'],
        releaseDate = json['ReleaseDate'],
        tag = json['Tag'],
        description = json['Description'];

  Map<String, dynamic> toJson() => {
        'Version': version,
        'Commit': commit,
        'ReleaseChannel': releaseChannel,
        'ReleaseDate': releaseDate,
        'Tag': tag,
        'Description': description,
      };
}
