import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          backgroundColor: const Color.fromRGBO(237, 95, 27, 1),
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
                color: CupertinoColors.white,
              ))),
      child: const Center(
        child: Text("Let's Play"),
      ),
    );
  }
}
