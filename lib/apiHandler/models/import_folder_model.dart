class ImportFolderModel {
  int? iD;
  bool? watchForNewFiles;
  int? dropFolderType;
  String? path;
  int? fileSize;
  String? name;
  int? size;

  ImportFolderModel(
      {iD, watchForNewFiles, dropFolderType, path, fileSize, name, size});

  ImportFolderModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    watchForNewFiles = json['WatchForNewFiles'];
    dropFolderType = json['DropFolderType'];
    path = json['Path'];
    fileSize = json['FileSize'];
    name = json['Name'];
    size = json['Size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['WatchForNewFiles'] = watchForNewFiles;
    data['DropFolderType'] = dropFolderType;
    data['Path'] = path;
    data['FileSize'] = fileSize;
    data['Name'] = name;
    data['Size'] = size;
    return data;
  }
}
