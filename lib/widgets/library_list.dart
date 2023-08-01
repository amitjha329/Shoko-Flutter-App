import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoko_anime_app/apiHandler/call.dart';
import 'package:shoko_anime_app/apiHandler/models/series_model.dart';
import 'package:shoko_anime_app/pages/view_series_group.dart';
import 'package:shoko_anime_app/utils/page_route_transition.dart';

class LibraryList extends StatefulWidget {
  const LibraryList(
      {super.key,
      required this.apiToken,
      required this.serverString,
      required this.seriesList});
  final String apiToken;
  final String serverString;
  final List<SeriesItem> seriesList;

  @override
  State<LibraryList> createState() => _LibraryListState();
}

class _LibraryListState extends State<LibraryList> {
  late Offset _tapPosition;
  int pageNumber = 2;
  int maxPages = 10;
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 5.0);
  late List<SeriesItem> seriesList;

  @override
  void initState() {
    seriesList = widget.seriesList;
    bool isLoading = false;
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !isLoading &&
          pageNumber <= maxPages) {
        setState(() {
          isLoading = true;
        });
        SeriesModel newList =
            await ShokoApiCall(widget.apiToken).getSeriesList(page: pageNumber);
        setState(() {
          pageNumber++;
          seriesList.addAll(newList.list!);
          maxPages = (newList.total! / 50).ceil();
          isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            childAspectRatio: 0.5,
            mainAxisExtent: 195),
        padding: const EdgeInsets.all(5),
        itemCount: seriesList.length,
        itemBuilder: (context, index) {
          return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(ScaledTransitionRoute(
                        ViewSeriesGroupPage(
                            posterId: seriesList
                                .elementAt(index)
                                .images!
                                .posters!
                                .elementAt(0)
                                .iD
                                .toString(),
                            apiToken: widget.apiToken,
                            serverString: widget.serverString,
                            id: seriesList
                                .elementAt(index)
                                .iDs!
                                .iD
                                .toString())));
                  },
                  onTapDown: (tapDetails) {
                    setState(() {
                      _tapPosition = tapDetails.globalPosition;
                    });
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Hero(
                              tag: seriesList
                                  .elementAt(index)
                                  .images!
                                  .posters!
                                  .elementAt(0)
                                  .iD
                                  .toString(),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            "${widget.serverString}/api/v3.0/Image/AniDB/Poster/${seriesList.elementAt(index).images?.posters?.elementAt(0).iD}"),
                                        fit: BoxFit.cover)),
                              )),
                        ),
                      ),
                      Text(
                        seriesList.elementAt(index).name ?? "",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  )));
        });
  }
}
