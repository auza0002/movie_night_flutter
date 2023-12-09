import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:movie_night_flutter/providers/game_provider.dart';
import 'package:movie_night_flutter/screens/slider_screen/container_game_slider.dart';
import 'package:movie_night_flutter/widgets/slider_widgets/image_swiper.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  String myKey = "";
  String myDeviceID = "";
  String codeValue = "";
  bool _validInput = false;

  void validator(String input) {
    bool valid = RegExp(r'^[0-9]+$').hasMatch(input) && input.length < 5;
    setState(() {
      _validInput = valid;
    });
  }

  @override
  void initState() {
    super.initState();

    myKey = context.read<GameProvider>().getMyKey;
    myDeviceID = context.read<GameProvider>().getMyDeviceID;
  }

  @override
  Widget build(BuildContext context) {
    context.read<GameProvider>().setIsHost();
    if (context.read<GameProvider>().getIsHost == false) {
      context.read<GameProvider>().setMyKey(myDeviceID);
    }
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color.fromARGB(151, 0, 0, 0),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'Sign up',
            style: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(237, 95, 27, 1),
            ),
          ),
        ),
        leading: Row(
          children: [
            Image.asset("assets/img/galaxy-spiral-shape-sm.png"),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: Text(
                "Movie Night",
                style: TextStyle(
                    color: Color.fromRGBO(237, 95, 27, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const FirstItemSwiper(),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
              child: Text(
                "Gaming Time",
                style:
                    CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
              child: Text(
                "Invite friends with a numeric code (up to 5 characters) to join, start the game, or host.",
                style: TextStyle(
                    color: CupertinoColors.inactiveGray,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "My room : $myKey",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CupertinoButton(
                    child: const Icon(CupertinoIcons.gamecontroller_alt_fill),
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const ContainerScreen(),
                        ),
                      );
                    },
                  ),
                  CupertinoButton(
                    child: const Icon(CupertinoIcons.share),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: CupertinoTextField(
                      onChanged: (text) {
                        validator(text);
                      },
                      maxLength: 15,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          fontSize: 20, color: Color.fromRGBO(237, 95, 27, 1)),
                      placeholder: "Enter room code",
                      prefix: const Text(
                        'Code',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      // controller: _textController,
                    ),
                  ),
                  CupertinoButton(
                    onPressed: _validInput ? () {} : null,
                    child: const Icon(CupertinoIcons.arrow_turn_up_right),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
