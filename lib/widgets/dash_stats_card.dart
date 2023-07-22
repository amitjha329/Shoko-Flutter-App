import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoko_anime_app/apiHandler/call.dart';
import 'package:shoko_anime_app/apiHandler/models/dashboard.dart';

class DashStats extends StatefulWidget {
  const DashStats({super.key, required this.apiToken});
  final String apiToken;
  @override
  State<DashStats> createState() => _StatsState();
}

class _StatsState extends State<DashStats> {
  Timer? timer;
  StatsResponse? dashStats;
  Future<StatsResponse>? futureDashStats;

  getData() async {
    ShokoApiCall(widget.apiToken).getDashboardStats().then((result) {
      setState(() {
        dashStats = result;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    futureDashStats = ShokoApiCall(widget.apiToken).getDashboardStats();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      getData();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        margin: const EdgeInsets.all(15),
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: FutureBuilder<StatsResponse>(
                future: futureDashStats,
                builder: (context, dataSnapShot) {
                  if (dataSnapShot.hasData) {
                    return Column(
                      children: [
                        Container(
                          alignment: AlignmentDirectional.centerEnd,
                          margin: const EdgeInsetsDirectional.symmetric(
                              vertical: 5),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              getData();
                            },
                            child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(Icons.refresh)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Series"),
                            Text(dataSnapShot.data!.seriesCount.toString())
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Collection"),
                            Text(
                                "${(dataSnapShot.data!.fileSize / (1024 * 1024 * 1024)).round()} GiB")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Files"),
                            Text(dataSnapShot.data!.fileCount.toString())
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Unrecognized"),
                            Text(
                                dataSnapShot.data!.unrecognizedFiles.toString())
                          ],
                        )
                      ],
                    );
                  } else if (dataSnapShot.hasError) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [const Text("Series"), Text(0.toString())],
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
                  }
                  return Card(
                    child: SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child:
                            const Center(child: CircularProgressIndicator())),
                  );
                })));
  }
}
