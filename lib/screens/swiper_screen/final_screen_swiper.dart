import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:movie_night_flutter/model/movide_model.dart';
import 'package:movie_night_flutter/providers/card_provider.dart';
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
    await Future.delayed(const Duration(seconds: 5));
    controller.stop();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CardProvider>();
    List<Result> match = provider.findMatchMovieOnList();

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
              children: [
                MatchContainer(match: match),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
