import 'package:flutter/material.dart';

class ViewSeriesGroupPage extends StatefulWidget {
  const ViewSeriesGroupPage({super.key, required this.id});
  final String id;
  @override
  State<ViewSeriesGroupPage> createState() => _ViewSeriesGroupPageState();
}

class _ViewSeriesGroupPageState extends State<ViewSeriesGroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
              )
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
