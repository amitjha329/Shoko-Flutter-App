import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoko_anime_app/apiHandler/call.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key, required this.apiToken});
  final String apiToken;

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  var _tapPosition;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ShokoApiCall.getServerUrl(),
      builder: (context, serverUrlSnapShot) => FutureBuilder(
        future: ShokoApiCall(widget.apiToken).getGroupList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 0.6),
                padding: const EdgeInsets.all(5),
                itemCount: snapshot.data?.list?.length,
                itemBuilder: (context, index) {
                  return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: InkWell(
                          onTap: () {},
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
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                "${serverUrlSnapShot.data}/api/v3.0/Image/AniDB/Poster/${snapshot.data?.list?.elementAt(index).images?.posters?.elementAt(0).iD}"),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                              Text(
                                snapshot.data?.list?.elementAt(index).name ??
                                    "",
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 12),
                              )
                            ],
                          )));
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
