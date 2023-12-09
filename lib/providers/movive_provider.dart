import 'package:flutter/material.dart';
import 'package:movie_night_flutter/model/movide_model.dart';
import 'package:movie_night_flutter/utils/http_helper_tmdb.dart';

class MoviesProvider with ChangeNotifier {
  List<Movies> movies = [];
  List<Movies> moviesGame = [];
  int countPages = 1;
  final _imgPath = "https://image.tmdb.org/t/p/original/";
  final _myKey =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMWEyMTM3M2ZmNGEzOGQ3NTliM2UxZmRkNGI0YzA5ZiIsInN1YiI6IjYzOGY2YmNmMDQ3MzNmMDA4NWQwYWFkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MoHcQDxp_anG4kiYxxLgZ4hywHvE670dDFZcP6ixJ_k";
  final url =
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1';

  String imgPatch(String img) {
    return _imgPath + img;
  }

  void getDataHomeScreen() async {
    List<Movies> movies =
        await HTTPHelperTMDB.getDataMovieHomeScreen(url, _myKey);
    this.movies = movies;
    moviesGame = movies;
    notifyListeners();
  }

  void getNewMoviesGame() async {
    countPages++;
    String urlMovieGame =
        'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=$countPages';
    moviesGame = [];
    List<Movies> movies =
        await HTTPHelperTMDB.getDataMovieHomeScreen(urlMovieGame, _myKey);
    moviesGame = movies;
  }

  List<Movies> get getMovies => movies;
  String get getImgPath => _imgPath;
  List<Movies> get getMoviesGame => moviesGame;
}