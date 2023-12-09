import 'package:flutter/cupertino.dart';
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
    context.read<GameProvider>().getDeviceID();
    context
        .read<GameProvider>()
        .setMyKey(context.read<GameProvider>().getMyDeviceID);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: const Color.fromARGB(188, 0, 0, 0),
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
          child: CupertinoButton.filled(
              child: const Text("Let's Play"),
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const ContainerScreen(),
                  ),
                );
              }),
        ));
  }
}
