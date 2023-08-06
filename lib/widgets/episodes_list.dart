import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoko_anime_app/apiHandler/call.dart';

class EpisodesListWidget extends StatefulWidget {
  const EpisodesListWidget(
      {super.key,
      required this.apiToken,
      required this.id,
      required this.serverString});
  final String apiToken;
  final String id;
  final String serverString;

  @override
  State<EpisodesListWidget> createState() => _EpisodesListWidgetState();
}

class _EpisodesListWidgetState extends State<EpisodesListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            ShokoApiCall(widget.apiToken).getSeriesEpisodesList(id: widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SliverList.builder(
              itemCount: snapshot.data?.list?.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    if (snapshot.data!.list!
                            .elementAt(index)
                            .tvDB![0]
                            .thumbnail!
                            .relativeFilepath !=
                        "")
                      {
                        SizedBox(
                          height: 75,
                          child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${widget.serverString}/api/v3.0/Image/TvDB/Thumb/${snapshot.data?.list?.elementAt(index).tvDB?[0].thumbnail?.iD}",
                              )),
                        )
                      }.first,
                    Flexible(
                        child: Text(snapshot.data?.list
                                ?.elementAt(index)
                                .tvDB?[0]
                                .title ??
                            snapshot.data?.list?.elementAt(index).name ??
                            ""))
                  ],
                );
              },
            );
          }
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
