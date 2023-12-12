import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

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
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ConfettiWidget(
          blastDirectionality: BlastDirectionality.explosive,
          confettiController: controller,
          shouldLoop: true,
        ),
        const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Final Screen",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text("There was a match!"),
            ],
          ),
        ),
      ],
    );
  }
}
