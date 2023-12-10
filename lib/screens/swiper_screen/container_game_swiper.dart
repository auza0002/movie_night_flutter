import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night_flutter/providers/card_provider.dart';
import 'package:movie_night_flutter/widgets/swiper_widgets/card_swiper.dart';

import 'package:provider/provider.dart';

class ContainerGameScreen extends StatefulWidget {
  const ContainerGameScreen({super.key});

  @override
  State<ContainerGameScreen> createState() => _ContainerGameScreenState();
}

class _ContainerGameScreenState extends State<ContainerGameScreen> {
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
    final movieGames = context.read<CardProvider>().getMovies;

    return Stack(
      children: movieGames
          .map(
            (item) => SwiperCard(
              resultItem: item,
              isFront: movieGames.last == item,
            ),
          )
          .toList(),
    );
  }
}
