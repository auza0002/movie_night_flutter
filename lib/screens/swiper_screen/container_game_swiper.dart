import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night_flutter/providers/card_provider.dart';
import 'package:movie_night_flutter/providers/movive_provider.dart';
import 'package:movie_night_flutter/widgets/swiper_widgets/card_swiper.dart';

import 'package:provider/provider.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      final provider = context.read<CardProvider>();
      provider.setScreenSize(size);
    });
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
          ),
        ),
      ),
      child: Center(
        child: buildCards(),
      ),
    );
  }

  Widget buildCards() {
    var movieGames = context.read<MoviesProvider>().getMoviesGame;
    var listMovies = movieGames[0].results.reversed.toList();
    return Stack(
      children: listMovies
          .map((item) => SwiperCard(
                resultItem: item,
                isFront: listMovies.last == item,
              ))
          .toList(),
    );
  }
}
