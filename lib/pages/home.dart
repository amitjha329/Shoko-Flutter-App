import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoko_anime_app/apiHandler/call.dart';
import 'package:shoko_anime_app/apiHandler/models/serverinfo_model.dart';
import 'package:shoko_anime_app/pages/views/dashboard.dart';
import 'package:shoko_anime_app/pages/views/import_folders.dart';
import 'package:shoko_anime_app/pages/views/library.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.apiToken});
  final String apiToken;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ServerInfoModel? _serverInfo;
  int _selectedIndex = 0;
  late List<MapEntry<Widget, Widget>> _viewList;
  @override
  void initState() {
    super.initState();
    _viewList = <MapEntry<Widget, Widget>>[
      MapEntry(const Text("Dashboard"), Dashboard(apiToken: widget.apiToken)),
      MapEntry(const Text("Import Folders"),
          ImportFolders(apiToken: widget.apiToken)),
      MapEntry(const Text("Library"), LibraryView(apiToken: widget.apiToken))
    ];
    ShokoApiCall(widget.apiToken).getServerInfo().then((value) {
      setState(() {
        _serverInfo = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _viewList.elementAt(_selectedIndex).key,
      ),
      drawer: Drawer(
          elevation: 20,
          child: Column(
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          opacity: 0.3,
                          image: AssetImage(
                              'assets/backgrounds/login_bg_desktop.png'))),
                  child: Column(
                    children: [
                      const Center(
                          child: Image(
                              image: AssetImage('assets/logo.png'),
                              alignment: Alignment.center,
                              height: 50,
                              width: 50)),
                      const Text("ShokoDroid"),
                      const Spacer(flex: 1),
                      Text(
                          "Server: ${_serverInfo?.server?.version} [${_serverInfo?.server?.releaseChannel}]"),
                      Text(
                          "WebUI: ${_serverInfo?.webUI?.version} [${_serverInfo?.webUI?.releaseChannel}]")
                    ],
                  )),
              Column(children: [
                InkWell(
                    child: ListTile(
                  leading: const Icon(CupertinoIcons.home),
                  iconColor: Theme.of(context).colorScheme.primary,
                  title: const Text("Dashboard"),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                    Navigator.pop(context);
                  },
                )),
                Divider(
                  indent: 15,
                  endIndent: 15,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                InkWell(
                    child: ListTile(
                  leading: const Icon(CupertinoIcons.folder),
                  iconColor: Theme.of(context).colorScheme.primary,
                  title: const Text("Import Folders"),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                    Navigator.pop(context);
                  },
                )),
                InkWell(
                    child: ListTile(
                  leading: const Icon(CupertinoIcons.photo_on_rectangle),
                  iconColor: Theme.of(context).colorScheme.primary,
                  title: const Text("Library"),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                    Navigator.pop(context);
                  },
                )),
                InkWell(
                    child: ListTile(
                  leading: const Icon(CupertinoIcons.hammer),
                  iconColor: Theme.of(context).colorScheme.primary,
                  title: const Text("Utilities"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )),
                Divider(
                  indent: 15,
                  endIndent: 15,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                InkWell(
                    child: ListTile(
                  leading: const Icon(CupertinoIcons.settings),
                  iconColor: Theme.of(context).colorScheme.primary,
                  title: const Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ))
              ])
            ],
          )),
      body: _viewList.elementAt(_selectedIndex).value,
    );
  }
}
