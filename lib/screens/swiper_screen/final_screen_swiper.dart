import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_night_flutter/model/movide_model.dart';
import 'package:movie_night_flutter/providers/card_provider.dart';
import 'package:movie_night_flutter/providers/game_provider.dart';
import 'package:movie_night_flutter/widgets/swiper_widgets/liked_movies.dart';
import 'package:movie_night_flutter/widgets/swiper_widgets/match_container.dart';
import 'package:provider/provider.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen({Key? key}) : super(key: key);

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  bool isPlaying = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller.play();
    _stopConfettiAfterDelay();
  }

  var controller = ConfettiController();

  Future<void> _stopConfettiAfterDelay() async {
    await Future.delayed(const Duration(seconds: 10));
    controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CardProvider>();
    final gameProvider = context.read<GameProvider>();
    List<Result> match = provider.findMatchMovieOnList(gameProvider.getMatch);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ConfettiWidget(
          blastDirectionality: BlastDirectionality.explosive,
          confettiController: controller,
          shouldLoop: true,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 125, left: 8, right: 8),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MatchContainer(match: match),
                const SizedBox(height: 40),
                Text(
                  "Liked Movies",
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                ),
                const LikedMovies(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
