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
      height: 400,
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              movies[0].results[0].title,
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}



// Image.network(
//             context
//                 .watch<MoviesProvider>()
//                 .imgePatch(movies[0].results[0].backdropPath),
//             fit: BoxFit.fitHeight,
//           ),