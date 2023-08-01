import 'package:flutter/material.dart';
import 'package:shoko_anime_app/apiHandler/call.dart';
import 'package:shoko_anime_app/widgets/library_list.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key, required this.apiToken});
  final String apiToken;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ShokoApiCall.getServerUrl(),
      builder: (context, serverUrlSnapShot) => FutureBuilder(
        future: ShokoApiCall(apiToken).getSeriesList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            return LibraryList(
                apiToken: apiToken,
                serverString: serverUrlSnapShot.data!,
                seriesList: snapshot.data!.list!);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
