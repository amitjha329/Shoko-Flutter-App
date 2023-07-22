import 'package:flutter/material.dart';
import 'package:shoko_anime_app/apiHandler/call.dart';

class ImportFolders extends StatefulWidget {
  const ImportFolders({super.key, required this.apiToken});
  final String apiToken;

  @override
  State<ImportFolders> createState() => _ImportFoldersState();
}

class _ImportFoldersState extends State<ImportFolders> {
  var _tapPosition;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ShokoApiCall(widget.apiToken).getImportFolders(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error');
        } else if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                return InkWell(
                    onLongPress: () async {
                      final overlay = Overlay.of(context)
                          .context
                          .findRenderObject() as RenderBox;
                      final result = await showMenu<String>(
                          items: [
                            const PopupMenuItem(
                                value: "scan", child: Text("Scan")),
                            const PopupMenuItem(
                                value: "watch", child: Text("Toggle Watch")),
                            const PopupMenuItem(
                                value: "drop", child: Text("Drop Type"))
                          ],
                          context: context,
                          position: RelativeRect.fromRect(
                              Rect.fromLTWH(
                                  _tapPosition.dx, _tapPosition.dy, 30, 30),
                              Rect.fromLTWH(
                                  0,
                                  0,
                                  overlay.paintBounds.size.width,
                                  overlay.paintBounds.size.height)));
                      switch (result) {}
                    },
                    onTapDown: (tapDetails) {
                      setState(() {
                        _tapPosition = tapDetails.globalPosition;
                      });
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Text(
                            snapshot.data?.elementAt(index).name ?? "{name}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Watching For Files",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .fontSize),
                              ),
                              Text(
                                snapshot.data
                                        ?.elementAt(index)
                                        .watchForNewFiles
                                        .toString() ??
                                    "false",
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .fontSize),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Series Count",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .fontSize),
                              ),
                              Text(
                                snapshot.data
                                        ?.elementAt(index)
                                        .size
                                        .toString() ??
                                    "0",
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .fontSize),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Size",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .fontSize),
                              ),
                              Text(
                                "${((snapshot.data?.elementAt(index).fileSize ?? 0) / (1024 * 1024 * 1024)).round()} GiB",
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .fontSize),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Drop Type",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .fontSize),
                              ),
                              Text(
                                (() {
                                  switch (snapshot.data!
                                      .elementAt(index)
                                      .dropFolderType) {
                                    case 0:
                                      {
                                        return "None";
                                      }
                                    case 1:
                                      {
                                        return "Source";
                                      }
                                    case 2:
                                      {
                                        return "Destination";
                                      }
                                    case 3:
                                      {
                                        return "Both";
                                      }
                                    default:
                                      {
                                        return "None";
                                      }
                                  }
                                }()),
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .fontSize),
                              )
                            ],
                          )
                        ],
                      ),
                    ));
              });
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
