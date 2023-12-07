import 'package:flutter/material.dart';
import 'package:movie_night_flutter/model/movide_model.dart';
import 'package:movie_night_flutter/providers/movives_provider.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({super.key});

  @override
  Widget build(BuildContext context) {
    List<Movies> movies = context.watch<MoviesProvider>().movies;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies[0].results.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              fadeInCurve: Curves.easeIn,
              image: NetworkImage(
                context.watch<MoviesProvider>().imgePatch(
                      movies[0].results[index].posterPath,
                    ),
              ),
              width: 150,
              height: 200,
            ),
            SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    movies[0].results[index].title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Subtitled",
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
