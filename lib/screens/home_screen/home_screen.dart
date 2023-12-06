import 'package:flutter/cupertino.dart';
import 'package:movie_night_flutter/providers/movives_home_provider.dart';
import 'package:movie_night_flutter/widgets/home_widgets/card_movie_home.dart';
import 'package:movie_night_flutter/widgets/home_widgets/first_item_home.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loadedData = false;

  @override
  Widget build(BuildContext context) {
    if (context.watch<MoviesProvider>().movies.isNotEmpty) {
      loadedData = true;
    }
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
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: const Text(
            'Sing up',
            style: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(237, 95, 27, 1),
            ),
          ),
        ),
      ),
      child: loadedData == false
          ? const Center(
              child: CupertinoActivityIndicator(
                radius: 20,
              ),
            )
          : CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: FirstItemHome(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 50, bottom: 100, left: 8, right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Top Rated Movies",
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .navTitleTextStyle,
                          ),
                        ),
                        const SizedBox(
                          height: 300,
                          child: CardMovie(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
