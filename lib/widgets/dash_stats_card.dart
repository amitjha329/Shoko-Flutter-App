import 'package:flutter/material.dart';
import 'package:shoko_anime_app/apiHandler/call.dart';
import 'package:shoko_anime_app/apiHandler/models/dashboard_stats_model.dart';

class DashStats extends StatefulWidget {
  const DashStats({super.key, required this.apiToken});
  final String apiToken;
  @override
  State<DashStats> createState() => _StatsState();
}

class _StatsState extends State<DashStats> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        margin: const EdgeInsets.all(15),
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: StreamBuilder<DashStatsResponse>(
                stream: Stream.periodic(const Duration(seconds: 3))
                    .asyncMap((event) {
                  return ShokoApiCall(widget.apiToken).getDashboardStats();
                }),
                builder: (context, dataSnapShot) {
                  if (dataSnapShot.connectionState == ConnectionState.waiting) {
                    return const SizedBox(
                        height: 70,
                        child: Center(child: CircularProgressIndicator()));
                  } else if (dataSnapShot.connectionState ==
                          ConnectionState.active ||
                      dataSnapShot.connectionState == ConnectionState.done) {
                    if (dataSnapShot.hasError) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Series"),
                              Text(0.toString())
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Collection"), Text("0 GiB")],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [const Text("Files"), Text(0.toString())],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Unrecognized"),
                              Text(0.toString())
                            ],
                          )
                        ],
                      );
                    } else if (dataSnapShot.hasData) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Series",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(dataSnapShot.data!.seriesCount.toString())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Collection",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  "${(dataSnapShot.data!.fileSize / (1024 * 1024 * 1024)).round()} GiB")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Files",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(dataSnapShot.data!.fileCount.toString())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Unrecognized",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(dataSnapShot.data!.unrecognizedFiles
                                  .toString())
                            ],
                          )
                        ],
                      );
                    } else {
                      return const Text('Empty data');
                    }
                  } else {
                    return Text('State: ${dataSnapShot.connectionState}');
                  }
                })));
  }
}
