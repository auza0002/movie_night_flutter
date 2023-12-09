import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night_flutter/providers/game_provider.dart';
import 'package:movie_night_flutter/screens/slider_screen/container_game_slider.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GameProvider>().setIsHost();
  }

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  height: 325,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/img/gameImg.jpeg"),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(1),
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.1),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 8, right: 8, bottom: 8),
                child: Text(
                  "Gaming Time",
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .navLargeTitleTextStyle,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Gather friends, be the host, and swipe left or right to find your perfect movie match. With a sleek design, galactic navigation, and a Let's Play button, Movie Night Matcher makes choosing movies a breeze. Get ready to swipe your way to unforgettable movie nights!",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton.filled(
                    child: const Text("Let's Play"),
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const ContainerScreen(),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
