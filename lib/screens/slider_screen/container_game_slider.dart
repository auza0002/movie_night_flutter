import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night_flutter/model/movide_model.dart';
import 'package:movie_night_flutter/providers/movives_provider.dart';
import 'package:provider/provider.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  List<Movies> movieList = [];
  @override
  void initState() {
    super.initState();
    movieList = context.read<MoviesProvider>().getMoviesGame;
    print(movieList[0].results.length);
  }

  @override
  Widget build(BuildContext context) {
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
              ))),
      child: const Center(
        child: Text("Let's Play"),
      ),
    );
  }
}
