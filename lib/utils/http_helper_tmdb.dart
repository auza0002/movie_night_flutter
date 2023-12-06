import 'dart:io';

import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';

class HTTPHelperTMDB {
  // get the upcoming movies, 20 at the time.
  // get the best anime moives, 10 at the time.
  // get the best anime series, 10 at the time.

  final uri = Uri.parse(
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1');

  final primaryList = [];
  final topMovies = [];
  final topTV = [];

  final _myKey =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMWEyMTM3M2ZmNGEzOGQ3NTliM2UxZmRkNGI0YzA5ZiIsInN1YiI6IjYzOGY2YmNmMDQ3MzNmMDA4NWQwYWFkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MoHcQDxp_anG4kiYxxLgZ4hywHvE670dDFZcP6ixJ_k";

  void getDataPrimaryList() async {
    Response response = await get(uri, headers: {
      HttpHeaders.authorizationHeader: 'Authorization: Bearer $_myKey',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      print("good response");
    } else {
      throw Exception("Did not get a valid response");
    }
  }
}
