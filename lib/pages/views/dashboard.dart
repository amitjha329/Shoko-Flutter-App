import 'package:flutter/material.dart';
import 'package:shoko_anime_app/pages/server_queue.dart';
import 'package:shoko_anime_app/widgets/collection_overview.dart';
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
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Text(
            "Collection Status",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        GestureDetector(
            child: DashStats(apiToken: widget.apiToken),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ServerQueue(
                        apiToken: widget.apiToken,
                      )));
            }),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Text(
            "Collection Overview",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        CollectionOverViewCard(apiToken: widget.apiToken)
      ],
    );
  }
}
