import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:shared_preferences_foundation/shared_preferences_foundation.dart';
import './models/auth.dart';

class ShokoApiCall {
  Future<String> getServerUrl() async {
    if (Platform.isAndroid) SharedPreferencesAndroid.registerWith();
    if (Platform.isIOS || Platform.isMacOS) {
      SharedPreferencesFoundation.registerWith();
    }
    final pref = await SharedPreferences.getInstance();
    return "http://${pref.getString('serverhost') ?? 'localhost'}:${pref.getString('serverport') ?? '8111'}";
  }

  Future<String> authenticate(String user, String pass) async {
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
    } else {
      throw Exception("Unable to login");
    }
  }
}
