import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoko_anime_app/apiHandler/call.dart';
import 'package:shoko_anime_app/apiHandler/models/queue_summary_model.dart';

class ServerQueue extends StatefulWidget {
  const ServerQueue({super.key, required this.apiToken});
  final String apiToken;
  @override
  State<ServerQueue> createState() => _ServerQueState();
}

class _ServerQueState extends State<ServerQueue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Server Queue"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: StreamBuilder<QueueSummaryModel>(
            stream: Stream.periodic(const Duration(seconds: 3))
                .asyncMap((event) async {
              return ShokoApiCall(widget.apiToken).getServerQueueSummary();
            }),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  return Column(children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Processing Files:",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.fontSize,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            (snapshot.data?.processFile ?? 0).toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hashing Files:",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.fontSize,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            (snapshot.data?.hashFile ?? 0).toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "AniDB Add File:",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.fontSize,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            (snapshot.data?.aniDBAddFileUDP ?? 0).toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "AniDB Get Anime:",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.fontSize,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            (snapshot.data?.aniDBGetAnimeHTTP ?? 0).toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Refresh Anime Stats:",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.fontSize,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            (snapshot.data?.refreshAnimeStats ?? 0).toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Download Images:",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.fontSize,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            (snapshot.data?.imageDownload ?? 0).toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Syncing Plex:",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.fontSize,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            (snapshot.data?.plexSync ?? 0).toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ),
                    )
                  ]);
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Text('State: ${snapshot.connectionState}');
              }
            },
          )),
    );
  }
}
