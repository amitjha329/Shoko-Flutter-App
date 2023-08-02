import 'dart:io';

import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:shared_preferences_foundation/shared_preferences_foundation.dart';
import 'package:shared_preferences_windows/shared_preferences_windows.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool saveLoginCreds;
  late Function({required String key, required dynamic value}) setSharedPrefs;
  handleSharedPreference() async {
    if (Platform.isAndroid) SharedPreferencesAndroid.registerWith();
    if (Platform.isIOS || Platform.isMacOS) {
      SharedPreferencesFoundation.registerWith();
    }
    if (Platform.isWindows) SharedPreferencesWindows.registerWith();
    final pref = await SharedPreferences.getInstance();
    saveLoginCreds = pref.getBool("saveLoginCreds") ?? false;

    setSharedPrefs = ({required String key, required dynamic value}) {
      if (value is bool) {
        pref.setBool(key, value);
      }
      if (value is String) {
        pref.setString(key, value);
      }
      if (value is int) {
        pref.setInt(key, value);
      }
      if (value is double) {
        pref.setDouble(key, value);
      }
    };
  }

  @override
  void initState() {
    handleSharedPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("App Settings"),
      ),
      body: SettingsList(sections: [
        SettingsSection(title: const Text("General Settings"), tiles: [
          SettingsTile.switchTile(
              initialValue: saveLoginCreds,
              onToggle: (value) {
                setSharedPrefs(key: "saveLoginCreds", value: value);
              },
              title: const Text("Save Login Credtionals"))
        ])
      ]),
    );
  }
}
