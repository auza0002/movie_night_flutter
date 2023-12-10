import 'package:flutter/cupertino.dart';
import 'package:movie_night_flutter/screens/favourites_screen/favourites_screen.dart';
import 'package:movie_night_flutter/screens/home_screen/home_screen.dart';
import 'package:movie_night_flutter/screens/swiper_screen/swiper_screen.dart';

class ScreenController extends StatefulWidget {
  const ScreenController({super.key});

  @override
  State<ScreenController> createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  final List<Widget> _tabs = [
    const HomeScreen(),
    const FavouritesScreen(),
    const SliderScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        primaryColor: Color.fromRGBO(237, 95, 27, 1),
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
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart_fill),
              label: 'Favourites',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.gamecontroller_alt_fill),
              label: 'Movie Game',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return _tabs[0];
            case 1:
              return _tabs[1];
            case 2:
              return _tabs[2];
            default:
              return _tabs[1];
          }
        },
      ),
    );
  }
}
