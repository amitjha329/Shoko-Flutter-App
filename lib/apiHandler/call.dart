import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:shared_preferences_foundation/shared_preferences_foundation.dart';
import 'package:shared_preferences_windows/shared_preferences_windows.dart';
import 'package:shoko_anime_app/apiHandler/models/collection_overview_model.dart';
import 'package:shoko_anime_app/apiHandler/models/dashboard_stats_model.dart';
import 'package:shoko_anime_app/apiHandler/models/episode_model.dart';
import 'package:shoko_anime_app/apiHandler/models/group_model.dart';
import 'package:shoko_anime_app/apiHandler/models/import_folder_model.dart';
import 'package:shoko_anime_app/apiHandler/models/queue_summary_model.dart';
import 'package:shoko_anime_app/apiHandler/models/series_data_model.dart';
import 'package:shoko_anime_app/apiHandler/models/series_model.dart';
import 'package:shoko_anime_app/apiHandler/models/serverinfo_model.dart';
import 'models/auth_model.dart';

class ShokoApiCall {
  ShokoApiCall(this.apikey);
  String? apikey;
  static Future<String> getServerUrl() async {
    if (Platform.isAndroid) SharedPreferencesAndroid.registerWith();
    if (Platform.isIOS || Platform.isMacOS) {
      SharedPreferencesFoundation.registerWith();
    }
    if (Platform.isWindows) SharedPreferencesWindows.registerWith();
    final pref = await SharedPreferences.getInstance();
    return "http://${pref.getString('serverhost') ?? 'localhost'}:${pref.getString('serverport') ?? '8111'}";
  }

  Future<String?> authenticate(String user, String pass) async {
    String serverUri = await getServerUrl();
    Response result = await post(Uri.parse("$serverUri/api/auth"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(AuthRequest(user, pass)));
    if (result.statusCode == 200) {
      AuthResponse authResponse =
          AuthResponse.fromJson(jsonDecode(result.body));
      return authResponse.apikey;
    } else if (result.statusCode == 401) {
      return "Unauthorized";
    } else {
      return null;
    }
  }

  Future<DashStatsResponse> getDashboardStats() async {
    String serverUri = await getServerUrl();
    Response result = await get(
        Uri.parse("$serverUri/api/v3.0/Dashboard/Stats"),
        headers: <String, String>{
          'apikey': apikey ?? "",
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'text/plain'
        });
    if (result.statusCode == 200) {
      DashStatsResponse statsRes =
          DashStatsResponse.fromJson(jsonDecode(result.body));
      return statsRes;
    } else {
      throw Exception("Connection Failed (Code: ${result.statusCode})");
    }
  }

  Future<CollectionOverviewModel> getCollectionOverview() async {
    String serverUri = await getServerUrl();
    Response result = await get(
        Uri.parse("$serverUri/api/v3.0/Dashboard/SeriesSummary"),
        headers: <String, String>{
          'apikey': apikey ?? "",
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'text/plain'
        });
    if (result.statusCode == 200) {
      CollectionOverviewModel statsRes =
          CollectionOverviewModel.fromJson(jsonDecode(result.body));
      return statsRes;
    } else {
      throw Exception("Connection Failed (Code: ${result.statusCode})");
    }
  }

  Future<QueueSummaryModel> getServerQueueSummary() async {
    String serverUri = await getServerUrl();
    Response result = await get(
        Uri.parse("$serverUri/api/v3.0/Dashboard/QueueSummary"),
        headers: <String, String>{
          'apikey': apikey ?? "",
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'text/plain'
        });
    if (result.statusCode == 200) {
      QueueSummaryModel statsRes =
          QueueSummaryModel.fromJson(jsonDecode(result.body));
      return statsRes;
    } else {
      throw Exception("Connection Failed (Code: ${result.statusCode})");
    }
  }

  Future<ServerInfoModel> getServerInfo() async {
    String serverUri = await getServerUrl();
    Response result = await get(Uri.parse("$serverUri/api/v3/Init/Version"),
        headers: <String, String>{
          'apikey': apikey ?? "",
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'text/plain'
        });
    if (result.statusCode == 200) {
      ServerInfoModel statsRes =
          ServerInfoModel.fromJson(jsonDecode(result.body));
      return statsRes;
    } else {
      throw Exception("Connection Failed (Code: ${result.statusCode})");
    }
  }

  Future<List<ImportFolderModel>> getImportFolders() async {
    String serverUri = await getServerUrl();
    Response result = await get(Uri.parse("$serverUri/api/v3.0/ImportFolder"),
        headers: <String, String>{
          'apikey': apikey ?? "",
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'text/plain'
        });
    if (result.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(result.body);
      List<ImportFolderModel> statsRes =
          jsonList.map((val) => ImportFolderModel.fromJson(val)).toList();
      return statsRes;
    } else {
      throw Exception("Connection Failed (Code: ${result.statusCode})");
    }
  }

  Future<GroupModel> getGroupList() async {
    String serverUri = await getServerUrl();
    Response result = await get(Uri.parse("$serverUri/api/v3.0/Group"),
        headers: <String, String>{
          'apikey': apikey ?? "",
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'text/plain'
        });
    if (result.statusCode == 200) {
      GroupModel statsRes = GroupModel.fromJson(jsonDecode(result.body));
      return statsRes;
    } else {
      throw Exception("Connection Failed (Code: ${result.statusCode})");
    }
  }

  Future<SeriesListModel> getSeriesList({int? page}) async {
    String serverUri = await getServerUrl();
    Response result = await get(
        Uri.parse("$serverUri/api/v3.0/Series?page=${page ?? 1}"),
        headers: <String, String>{
          'apikey': apikey ?? "",
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'text/plain'
        });
    if (result.statusCode == 200) {
      log(result.body);
      SeriesListModel statsRes =
          SeriesListModel.fromJson(jsonDecode(result.body));
      return statsRes;
    } else {
      throw Exception("Connection Failed (Code: ${result.statusCode})");
    }
  }

  Future<SeriesItem> getSeriesData({required String id}) async {
    String serverUri = await getServerUrl();
    Response result = await get(
        Uri.parse(
            "$serverUri/api/v3.0/Series/$id?includeDataFrom=AniDB&includeDataFrom=TvDB&includeDataFrom=Shoko"),
        headers: <String, String>{
          'apikey': apikey ?? "",
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'text/plain'
        });
    if (result.statusCode == 200) {
      SeriesItem statsRes = SeriesItem.fromJson(jsonDecode(result.body));
      return statsRes;
    } else {
      throw Exception("Connection Failed (Code: ${result.statusCode})");
    }
  }

  Future<EpisodesListModel> getSeriesEpisodesList({required String id}) async {
    String serverUri = await getServerUrl();
    Response result = await get(
        Uri.parse(
            "$serverUri/api/v3.0/Series/$id/Episode?pageSize=0&page=1&includeMissing=true&includeDataFrom=AniDB&includeDataFrom=TvDB&type=Normal"),
        headers: <String, String>{
          'apikey': apikey ?? "",
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'text/plain'
        });
    if (result.statusCode == 200) {
      EpisodesListModel statsRes =
          EpisodesListModel.fromJson(jsonDecode(result.body));
      return statsRes;
    } else {
      throw Exception("Connection Failed (Code: ${result.statusCode})");
    }
  }
}
