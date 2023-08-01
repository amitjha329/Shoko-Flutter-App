import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shoko_anime_app/apiHandler/call.dart';
import 'package:shoko_anime_app/apiHandler/models/series_model.dart';

class ViewSeriesGroupPage extends StatefulWidget {
  const ViewSeriesGroupPage(
      {super.key,
      required this.id,
      required this.serverString,
      required this.posterId,
      required this.apiToken});
  final String apiToken;
  final String id;
  final String posterId;
  final String serverString;
  @override
  State<ViewSeriesGroupPage> createState() => _ViewSeriesGroupPageState();
}

class _ViewSeriesGroupPageState extends State<ViewSeriesGroupPage> {
  String rating = "";
  String episodes = "";
  String votes = "";
  @override
  void initState() {
    ShokoApiCall(widget.apiToken).getSeriesData(id: widget.id).then((series) {
      setState(() {
        rating = (series.aniDB!.rating!.value! / 100).toStringAsFixed(2);
        episodes = series.aniDB!.episodeCount.toString();
        votes = series.aniDB!.rating!.votes!.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            centerTitle: true,
            title: Text("Series Details"),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Hero(
                              tag: widget.posterId,
                              child: CachedNetworkImage(
                                  imageUrl:
                                      "${widget.serverString}/api/v3.0/Image/AniDB/Poster/${widget.posterId}")),
                        ),
                      ),
                      Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 90,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all()),
                                child: Column(
                                  children: [
                                    Icon(FontAwesome.video, shadows: [
                                      Shadow(
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.5),
                                          offset: const Offset(0, 3))
                                    ]),
                                    const Text("Episodes"),
                                    Text(
                                      episodes,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 90,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all()),
                                child: Column(
                                  children: [
                                    Icon(FontAwesome.people_group, shadows: [
                                      Shadow(
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.5),
                                          offset: const Offset(0, 3))
                                    ]),
                                    const Text("Votes"),
                                    Text(
                                      votes,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 90,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all()),
                                child: Column(
                                  children: [
                                    Icon(FontAwesome.star_half_stroke,
                                        shadows: [
                                          Shadow(
                                              blurRadius: 10,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              offset: const Offset(0, 3))
                                        ]),
                                    const Text("Rating"),
                                    Text(
                                      rating,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                  FutureBuilder(
                      future: ShokoApiCall(widget.apiToken)
                          .getSeriesData(id: widget.id),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  snapshot.data?.name ?? "",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                const Divider(
                                  height: 30,
                                ),
                                Text(
                                  snapshot.data?.aniDB?.description ?? "",
                                  textAlign: TextAlign.justify,
                                )
                              ],
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
