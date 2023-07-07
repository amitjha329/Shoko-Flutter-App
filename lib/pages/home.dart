import 'package:flutter/material.dart';
import 'package:shoko_anime_app/pages/views/dashboard.dart';
import 'package:shoko_anime_app/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.apiToken});
  final String apiToken;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      drawer: const NavDrawer(),
      body: Dashboard(apiToken: widget.apiToken),
    );
  }
}
