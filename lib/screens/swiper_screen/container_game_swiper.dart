import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night_flutter/providers/card_provider.dart';
import 'package:movie_night_flutter/providers/game_provider.dart';
import 'package:movie_night_flutter/screens/swiper_screen/final_screen_swiper.dart';
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
    final provider = context.watch<CardProvider>();
    final gameProvider = context.watch<GameProvider>();
    if (provider.getMovies.isEmpty) {
      provider.setMovies();
    }
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color.fromARGB(188, 0, 0, 0),
        trailing: Text("Liked ${provider.getMoviesLiked.length}"),
        middle: const Text(
          "Let's Play",
          style: TextStyle(
            color: CupertinoColors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            provider.setInitalListValues();
            gameProvider.initialGameStatus();
            Navigator.of(context).pop();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Color.fromRGBO(237, 95, 27, 1),
          ),
        ),
      ),
      child: Center(
        child: gameProvider.getStatus == GameMatchStatus.match
            ? const FinalScreen()
            : Builder(
                builder: (BuildContext context) {
                  if (provider.getMovies.isEmpty) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Loading ..."),
                        SizedBox(
                          height: 20,
                        ),
                        CupertinoActivityIndicator(),
                      ],
                    );
                  } else {
                    return Stack(
                      children: [
                        for (var i = 0; i < provider.getMovies.length; i++)
                          SwiperCard(
                            key: ValueKey(provider.getMovies[i].id),
                            resultItem: provider.getMovies[i],
                          ),
                      ],
                    );
                  }
                },
              ),
      ),
    );
  }
}
