import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Utilities extends StatelessWidget {
  const Utilities({super.key, required this.apiToken});
  final String apiToken;
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        childAspectRatio: 1,
      ),
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesome.list,
                    size: 30,
                  ),
                  Text(
                    "Actions",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              )),
        ),
        Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesome.file_circle_question,
                    size: 30,
                  ),
                  Text(
                    "Unrecognized",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              )),
        )
      ],
    );
  }
}
