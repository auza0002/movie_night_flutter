import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night_flutter/model/movide_model.dart';
import 'package:movie_night_flutter/providers/movives_home_provider.dart';
import 'package:provider/provider.dart';

class FirstItemHome extends StatelessWidget {
  const FirstItemHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<Movies> movies = context.watch<MoviesProvider>().movies;
    return SizedBox(
      height: 500,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              context.watch<MoviesProvider>().imgePatch(
                    movies[0].results[0].backdropPath,
                  ),
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(0.2),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movies[0].results[0].title,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle,
                    ),
                    Text(
                      maxLines: 3,
                      movies[0].results[0].overview,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CupertinoButton.filled(
                      onPressed: () {},
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(CupertinoIcons.play_arrow_solid),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Watch Now'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
