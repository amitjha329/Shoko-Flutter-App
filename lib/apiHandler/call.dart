import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:shared_preferences_foundation/shared_preferences_foundation.dart';
import 'package:shared_preferences_windows/shared_preferences_windows.dart';
import 'package:shoko_anime_app/apiHandler/models/dashboard.dart';
import './models/auth.dart';

class ShokoApiCall {
  ShokoApiCall(this.apikey);
  String? apikey;
  Future<String> getServerUrl() async {
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

  Future<StatsResponse> getDashboardStats() async {
    String serverUri = await getServerUrl();
    Response result = await get(
        Uri.parse("$serverUri/api/v3.0/Dashboard/Stats"),
        headers: <String, String>{
          'apikey': apikey ?? "",
          'Content-Type': 'text/plain; charset=UTF-8'
        });
    if (result.statusCode == 200) {
      StatsResponse statsRes = StatsResponse.fromJson(jsonDecode(result.body));
      return statsRes;
    } else {
      throw Exception("Connection Failed (Code: ${result.statusCode})");
    }
  }
}
