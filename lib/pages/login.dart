import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:shared_preferences_foundation/shared_preferences_foundation.dart';
import 'package:shared_preferences_windows/shared_preferences_windows.dart';
import 'package:shoko_anime_app/apiHandler/call.dart';
import 'package:shoko_anime_app/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passVisibility = false;
  TextEditingController serverPortController = TextEditingController();
  TextEditingController serverHostController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    getSharedPref();
  }

  getSharedPref() async {
    if (Platform.isAndroid) SharedPreferencesAndroid.registerWith();
    if (Platform.isIOS || Platform.isMacOS) {
      SharedPreferencesFoundation.registerWith();
    }
    if (Platform.isWindows) SharedPreferencesWindows.registerWith();
    prefs = await SharedPreferences.getInstance();
    serverHostController.text = prefs?.getString("serverhost") ?? "";
    serverPortController.text = prefs?.getString("serverport") ?? "";
    usernameController.text = prefs?.getString("user") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
                minWidth: MediaQuery.of(context).size.width),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("assets/backgrounds/login_bg_desktop.png"),
                      fit: BoxFit.cover)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image(
                        image: Image.asset("assets/logo.png").image,
                        height: 100,
                        width: 100,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        constraints: const BoxConstraints(maxWidth: 700),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Enter Server Details",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width:
                                        (MediaQuery.of(context).size.width > 700
                                                ? 700
                                                : MediaQuery.of(context)
                                                    .size
                                                    .width) -
                                            150,
                                    child: TextField(
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                      controller: serverHostController,
                                      decoration: InputDecoration(
                                          label: const Text("IP/Domain"),
                                          hintText: "192.168.1.11",
                                          hintStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                          labelStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12))),
                                    )),
                                Text(":",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary)),
                                SizedBox(
                                    width: 70,
                                    child: TextField(
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                      controller: serverPortController,
                                      decoration: InputDecoration(
                                          label: const Text("Port"),
                                          hintText: "8111",
                                          hintStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                          labelStyle: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12))),
                                    )),
                              ],
                            ),
                            AutofillGroup(
                                child: Column(children: [
                              TextField(
                                autofillHints: const [AutofillHints.username],
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                                controller: usernameController,
                                decoration: InputDecoration(
                                    label: const Text("Username"),
                                    labelStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                                controller: passwordController,
                                obscureText: !_passVisibility,
                                obscuringCharacter: "*",
                                autofillHints: const [AutofillHints.password],
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passVisibility = !_passVisibility;
                                          });
                                        },
                                        icon: Icon(
                                          _passVisibility
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        )),
                                    label: const Text("Password"),
                                    labelStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              )
                            ]))
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.all(15),
                        child: TextButton(
                            onPressed: () async {
                              if (serverHostController.text.isNotEmpty ||
                                  serverPortController.text.isNotEmpty) {
                                prefs?.setString(
                                    "serverhost", serverHostController.text);
                                prefs?.setString(
                                    "serverport", serverPortController.text);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Enter Valid Host and port"),
                                        behavior: SnackBarBehavior.floating));
                                return;
                              }
                              if (usernameController.text.isEmpty ||
                                  passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Username/Password cannot be empty"),
                                        behavior: SnackBarBehavior.floating));
                                return;
                              }
                              prefs?.setString("user", usernameController.text);
                              ShokoApiCall("")
                                  .authenticate(usernameController.text,
                                      passwordController.text)
                                  .then((value) {
                                if (value == "Unauthorized") {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Wrong Username/Password")));
                                } else if (value == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Server Error")));
                                } else {
                                  TextInput.finishAutofillContext();
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomePage(apiToken: value)));
                                }
                              });
                            },
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                                backgroundColor: MaterialStatePropertyAll(
                                    Theme.of(context).colorScheme.primary),
                                minimumSize: MaterialStatePropertyAll(
                                    Size.fromWidth(
                                        MediaQuery.of(context).size.width))),
                            child: Text("Login",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary))),
                      )
                    ]),
              ),
            )),
      ),
    );
  }
}
