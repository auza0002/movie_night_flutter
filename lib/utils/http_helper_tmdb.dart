import 'dart:io';

import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';

class HTTPHelperTMDB {
  // get the upcoming movies, 20 at the time.
  // get the best anime moives, 10 at the time.
  // get the best anime series, 10 at the time.

  // ! URI TMDB API
  final uri = Uri.parse(
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1');

  // ! List to store data to display on divice
  final primaryList = [];
  final topMovies = [];
  final topTV = [];

  // ! My key
  final _myKey =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMWEyMTM3M2ZmNGEzOGQ3NTliM2UxZmRkNGI0YzA5ZiIsInN1YiI6IjYzOGY2YmNmMDQ3MzNmMDA4NWQwYWFkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MoHcQDxp_anG4kiYxxLgZ4hywHvE670dDFZcP6ixJ_k";

  // ?  Functionallity
  void getDataPrimaryList() async {
    Response response = await get(uri, headers: {
      HttpHeaders.authorizationHeader: 'Authorization: Bearer $_myKey',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
  }
}
