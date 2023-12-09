import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                "Invite friends using the code or enter a valid room code to join and start the game.",
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
                  const SizedBox(
                    width: 200,
                    child: CupertinoTextField(
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(237, 95, 27, 1)),
                      placeholder: "Enter room code",
                      prefix: Text(
                        'Code',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      // controller: _textController,
                    ),
                  ),
                  CupertinoButton(
                    child: const Icon(CupertinoIcons.arrow_turn_up_right),
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const ContainerScreen(),
                        ),
                      );
                    },
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
