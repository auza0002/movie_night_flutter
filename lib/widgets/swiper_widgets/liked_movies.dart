import 'package:flutter/cupertino.dart';
import 'package:movie_night_flutter/model/movide_model.dart';
import 'package:movie_night_flutter/providers/card_provider.dart';
import 'package:movie_night_flutter/providers/movive_provider.dart';
import 'package:provider/provider.dart';

class LikedMovies extends StatelessWidget {
  const LikedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CardProvider>();
    final movieProvider = context.read<MoviesProvider>();

    List<Result> moviesLiked = provider.getMoviesLiked;
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: SingleChildScrollView(
        child: CupertinoListSection(
          children: [
            for (var movie in moviesLiked)
              CupertinoListTile(
                leading: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    movieProvider.imgPach(movie.posterPath),
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  movie.title,
                  style: const TextStyle(fontSize: 15),
                ),
                subtitle: SizedBox(
                  width: 150,
                  child: Text(movie.overview, maxLines: 1),
                ),
                trailing: const Icon(CupertinoIcons.heart),
              ),
          ],
        ),
      ),
    );
  }
}
