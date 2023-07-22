import 'package:flutter/material.dart';
import 'package:shoko_anime_app/pages/server_queue.dart';
import 'package:shoko_anime_app/widgets/dash_stats_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.apiToken});
  final String apiToken;
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            child: DashStats(apiToken: widget.apiToken),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ServerQueue(
                        apiToken: widget.apiToken,
                      )));
            }),
      ],
    );
  }
}
