import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_night_flutter/model/movide_model.dart';
import 'package:movie_night_flutter/utils/http_helper_tmdb.dart';

enum CardStatus { like, dislike }

class CardProvider extends ChangeNotifier {
  int count = 0;
  final _myKey =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMWEyMTM3M2ZmNGEzOGQ3NTliM2UxZmRkNGI0YzA5ZiIsInN1YiI6IjYzOGY2YmNmMDQ3MzNmMDA4NWQwYWFkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MoHcQDxp_anG4kiYxxLgZ4hywHvE670dDFZcP6ixJ_k";
  final url =
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=';

  List<Result> movies = [];
  List<Result> moviesLiked = [];
  List<Result> moviesDisliked = [];

  bool _isDragging = false;
  double _angle = 0;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;
  List<Result> get getMovies => movies;
  List<Result> get getMoviesLiked => moviesLiked;
  List<Result> get getMoviesDisliked => moviesDisliked;

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void setInitalListValues() {
    moviesLiked = [];
    moviesDisliked = [];
    movies = [];
    count = 0;
  }

  void setMovies() async {
    count++;
    List<Movies> movies =
        await HTTPHelperTMDB.getDataMovieHomeScreen(url, _myKey, count++);
    this.movies = movies[0].results.reversed.toList();
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;

    notifyListeners();
  }

  bool endPosition(int id) {
    _isDragging = false;
    bool result = false;
    final status = getStatus();
    switch (status) {
      case CardStatus.like:
        like();
        moviesLiked.add(movies.firstWhere((element) => element.id == id));
        result = true;
        notifyListeners();
        break;
      case CardStatus.dislike:
        dislike();
        moviesDisliked.add(movies.firstWhere((element) => element.id == id));
        break;
      default:
        resetPosition();
    }
    notifyListeners();
    return result;
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }

  CardStatus? getStatus() {
    final x = _position.dx;
    final delta = 100;

    if (x >= delta) {
      return CardStatus.like;
    } else if (x <= -delta) {
      return CardStatus.dislike;
    }
    return null;
  }

  void dislike() {
    _angle = -20;
    _position -= Offset(2 * _screenSize.width, 0);
    _nextCard();
    Fluttertoast.cancel();
    notifyListeners();
  }

  void like() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);
    _nextCard();
    Fluttertoast.showToast(
      msg: "Movie added to liked list",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromRGBO(98, 98, 98, 1),
      textColor: Colors.white,
      fontSize: 16.0,
    );

    notifyListeners();
  }

  Future _nextCard() async {
    await Future.delayed(
      const Duration(milliseconds: 350),
    );
    movies.removeLast();
    resetPosition();
  }
}
