import 'dart:io';

import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';

import 'package:movie_night_flutter/model/movide_model.dart';

class HTTPHelperTMDB {
  static Future<List<Movies>> getDataMovieHomeScreen(
      String url, String key) async {
    Uri uri = Uri.parse(url);
    String myKey = key;
    Response response = await get(uri, headers: {
      HttpHeaders.authorizationHeader: 'Authorization: Bearer $myKey',
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      var movies = Movies.fromJson(data);
      return [movies];
    } else {
      throw Exception("Did not get a valid response");
    }
  }
}
