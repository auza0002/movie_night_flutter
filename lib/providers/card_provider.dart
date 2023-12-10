import 'package:flutter/cupertino.dart';

import 'package:movie_night_flutter/model/movide_model.dart';
import 'package:movie_night_flutter/utils/http_helper_tmdb.dart';

enum CardStatus { like, dislike }

class CardProvider extends ChangeNotifier {
  final _myKey =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMWEyMTM3M2ZmNGEzOGQ3NTliM2UxZmRkNGI0YzA5ZiIsInN1YiI6IjYzOGY2YmNmMDQ3MzNmMDA4NWQwYWFkMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MoHcQDxp_anG4kiYxxLgZ4hywHvE670dDFZcP6ixJ_k";
  final url =
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1';

  List<Result> movies = [];

  bool _isDragging = false;
  double _angle = 0;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;
  List<Result> get getMovies => movies;

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void setMovies() async {
    List<Movies> movies =
        await HTTPHelperTMDB.getDataMovieHomeScreen(url, _myKey);
    this.movies = movies[0].results;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;

    notifyListeners();
  }

  void endPosition() {
    _isDragging = false;
    notifyListeners();
    final status = getStatus();
    // if (status != null) {
    //   Fluttertoast.cancel();
    //   Fluttertoast.showToast(
    //     msg: status.toString().split('.').last.toUpperCase(),
    //     fontSize: 36,
    //   );
    // }
    switch (status) {
      case CardStatus.like:
        like();
        break;
      default:
        resetPosition();
    }
  }

  void resetPosition() {
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }

  CardStatus? getStatus() {
    final x = _position.dx;
    final y = _position.dy;
    final delta = 100;

    if (x >= delta) {
      return CardStatus.like;
    } else if (x <= -delta) {
      return CardStatus.dislike;
    }
  }

  void dislike() {
    _angle = -20;
    _position -= Offset(2 * _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }

  void like() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }

  Future _nextCard() async {
    if (movies.isEmpty) return;
    print("movies length: ${movies.length}");
    await Future.delayed(const Duration(milliseconds: 200));
    movies.removeLast();
    resetPosition();
  }
}