import 'package:flutter/material.dart';
import 'package:shoko_anime_app/apiHandler/call.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.apiToken});
  final String apiToken;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int seriesCount = 0;
  String collectionSize = "";
  int fileCount = 0;
  int unrecognized = 0;

  @override
  void initState() {
    super.initState();
    ShokoApiCall(widget.apiToken).getDashboardStats().then((result) {
      setState(() {
        seriesCount = result.seriesCount;
        collectionSize =
            "${(result.fileSize / (1024 * 1024 * 1024)).round()} GiB";
        fileCount = result.fileCount;
        unrecognized = result.unrecognizedFiles;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      drawer: const Drawer(elevation: 20, child: Text("")),
      body: Column(
        children: [
          Card(
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
                          Text(seriesCount.toString())
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Collection"),
                          Text(collectionSize)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Files"),
                          Text(fileCount.toString())
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Unrecognized"),
                          Text(unrecognized.toString())
                        ],
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
