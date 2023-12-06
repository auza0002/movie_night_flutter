import 'package:flutter/material.dart';
import 'package:movie_night_flutter/model/primary.dart';
import 'package:movie_night_flutter/screen_controller.dart';
import 'package:movie_night_flutter/utils/http_helper_tmdb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Movies> movies = [];

  final _myKey =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMWEyMTM3M2ZmNGEzOGQ3NTliM2UxZmRkNGI0YzA5ZiIsInN1YiI6IjYzOGY2YmNmMDQ3MzNmMDA4NWQwYWFkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MoHcQDxp_anG4kiYxxLgZ4hywHvE670dDFZcP6ixJ_k";
  final url =
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1';

  void getDataHomeScreen() async {
    List<Movies> movies =
        await HTTPHelperTMDB.getDataMovieHomeScreen(url, _myKey);
    setState(() {
      this.movies = movies;
    });
  }

  @override
  void initState() {
    super.initState();
    getDataHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const ScreenController();
  }
}
