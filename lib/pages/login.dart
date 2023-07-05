import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passVisibility = false;
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
                          AssetImage("assets/backgrounds/login_bg_mobile.png"),
                      fit: BoxFit.cover)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Image(
                    image: Image.asset("assets/logo.png").image,
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(12),
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Enter Server Details",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                        TextField(
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                          decoration: InputDecoration(
                              label: const Text("Server Address"),
                              hintText: "http://192.168.1.11:8111",
                              hintStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                        TextField(
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                          decoration: InputDecoration(
                              label: const Text("Username"),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                        TextField(
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                          obscureText: !_passVisibility,
                          obscuringCharacter: "*",
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
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )),
                              label: const Text("Password"),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.all(15),
        child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
                backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.primary),
                minimumSize: MaterialStatePropertyAll(
                    Size.fromWidth(MediaQuery.of(context).size.width))),
            child: Text("Login",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary))),
      ),
    );
  }
}
