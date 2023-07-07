import 'package:flutter/material.dart';
import 'package:shoko_anime_app/widgets/drawer.dart';

class ServerQueue extends StatefulWidget {
  const ServerQueue({super.key});
  @override
  State<ServerQueue> createState() => _ServerQueState();
}

class _ServerQueState extends State<ServerQueue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Server Queue"),
      ),
      drawer: const NavDrawer(),
      body: Column(),
    );
  }
}
