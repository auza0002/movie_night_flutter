import 'package:flutter/cupertino.dart';
import 'package:movie_night_flutter/screens/slider_screen/code_screen_slider.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({super.key});

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
          child: CupertinoButton(
              child: const Text("new screen"),
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const CodeScre(),
                  ),
                );
              }),
        ));
  }
}
