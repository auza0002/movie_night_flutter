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
  Widget build(BuildContext context) {
    final provider = context.watch<CardProvider>().getMovies;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color.fromARGB(188, 0, 0, 0),
        middle: const Text(
          "Let's Play",
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
        child: Stack(
          children: [
            for (var i = 0; i < provider.length; i++)
              SwiperCard(
                resultItem: provider[i],
                isFront: provider.last == provider[i],
              ),
          ],
        ),
      ),
    );
  }
}
