import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night_flutter/model/movide_model.dart';
import 'package:movie_night_flutter/providers/game_provider.dart';
import 'package:movie_night_flutter/providers/movive_provider.dart';
import 'package:provider/provider.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  List<Movies> movieList = [];
  String myKey = "";
  String myDeviceID = "";

  @override
  void initState() {
    super.initState();
    movieList = context.read<MoviesProvider>().getMoviesGame;
    myKey = context.read<GameProvider>().getMyKey;
    myDeviceID = context.read<GameProvider>().getMyDeviceID;
  }

  @override
  Widget build(BuildContext context) {
    print(context.read<GameProvider>().getIsHost);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color.fromARGB(188, 0, 0, 0),
        middle: const Text(
          "Lest's Play",
          style: TextStyle(
            color: CupertinoColors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            CupertinoIcons.back,
            color: Color.fromRGBO(237, 95, 27, 1),
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("My key room"),
            Text(myKey),
          ],
        ),
      ),
    );
  }
}
