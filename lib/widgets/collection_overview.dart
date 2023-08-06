import 'package:flutter/material.dart';
import 'package:shoko_anime_app/apiHandler/call.dart';
import 'package:shoko_anime_app/apiHandler/models/dashboard_stats_model.dart';

class CollectionOverViewCard extends StatefulWidget {
  const CollectionOverViewCard({super.key, required this.apiToken});
  final String apiToken;

  @override
  State<CollectionOverViewCard> createState() => _CollectionOverViewCardState();
}

class _CollectionOverViewCardState extends State<CollectionOverViewCard> {
  int totalSeries = 1;
  late Future<DashStatsResponse> dashStatsFuture;

  @override
  void initState() {
    dashStatsFuture = ShokoApiCall(widget.apiToken).getDashboardStats();
    super.initState();
    getDashStats();
  }

  getDashStats() async {
    var dashStats = await dashStatsFuture;
    setState(() {
      totalSeries = dashStats.seriesCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ShokoApiCall(widget.apiToken).getCollectionOverview(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Card(
              elevation: 8,
              margin: const EdgeInsets.all(15),
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Series"),
                          Text((((snapshot.data?.series ?? 0) / totalSeries) *
                                  100)
                              .toStringAsFixed(2))
                        ],
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: LinearProgressIndicator(
                            minHeight: 10,
                            color: Colors.redAccent,
                            backgroundColor: Colors.grey.shade50,
                            value: ((snapshot.data?.series ?? 0) / totalSeries),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("OVA"),
                          Text((((snapshot.data?.oVA ?? 0) / totalSeries) * 100)
                              .toStringAsFixed(2))
                        ],
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: LinearProgressIndicator(
                            minHeight: 10,
                            color: Colors.blueAccent,
                            backgroundColor: Colors.grey.shade50,
                            value: ((snapshot.data?.oVA ?? 0) / totalSeries),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Movies"),
                          Text((((snapshot.data?.movie ?? 0) / totalSeries) *
                                  100)
                              .toStringAsFixed(2))
                        ],
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: LinearProgressIndicator(
                            minHeight: 10,
                            color: Colors.yellow.shade700,
                            backgroundColor: Colors.grey.shade50,
                            value: ((snapshot.data?.movie ?? 0) / totalSeries),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Other"),
                          Text((((snapshot.data?.other ?? 0) / totalSeries) *
                                  100)
                              .toStringAsFixed(2))
                        ],
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: LinearProgressIndicator(
                            minHeight: 10,
                            color: Colors.greenAccent,
                            backgroundColor: Colors.grey.shade50,
                            value: ((snapshot.data?.other ?? 0) / totalSeries),
                          ))
                    ],
                  )),
            );
          }
          return Container(
            child: CircularProgressIndicator(),
          );
        });
  }
}
