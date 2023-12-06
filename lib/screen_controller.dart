import 'package:flutter/cupertino.dart';
import 'package:movie_night_flutter/pages/favourites_screen/favourites_screen.dart';
import 'package:movie_night_flutter/pages/home_screen/home_screen.dart';

class ScreenController extends StatefulWidget {
  const ScreenController({super.key});

  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  final List<Widget> _tabs = [
    const HomeScreen(),
    const FavouritesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(fontFamily: "Trebuchet"),
        ),
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_fill),
              label: 'Recents',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return _tabs[0];
            case 1:
              return _tabs[1];
            default:
              return _tabs[0];
          }
        },
      ),
    );
  }
}
