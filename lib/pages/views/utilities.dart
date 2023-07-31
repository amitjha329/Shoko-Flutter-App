import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Utilities extends StatelessWidget {
  const Utilities({super.key, required this.apiToken});
  final String apiToken;
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,
          childAspectRatio: 1,
          crossAxisSpacing: 15,
          mainAxisSpacing: 10),
      children: [
        Card(
          child: Column(
            children: [Logo(Logos.plex), Text("Plex")],
          ),
        ),
        Card(
          child: Column(
            children: [Logo(Logos.plex), Text("Plex")],
          ),
        ),
        Card(
          child: Column(
            children: [Logo(Logos.plex), Text("Plex")],
          ),
        ),
        Card(
          child: Column(
            children: [Logo(Logos.plex), Text("Plex")],
          ),
        ),
        Card(
          child: Column(
            children: [Logo(Logos.plex), Text("Plex")],
          ),
        )
      ],
    );
  }
}
