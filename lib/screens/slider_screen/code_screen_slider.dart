import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CodeScre extends StatelessWidget {
  const CodeScre({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          // backgroundColor: const Color.fromARGB(188, 0, 0, 0),
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
        child: Text("new screen"),
      ),
    );
  }
}
