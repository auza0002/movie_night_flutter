import 'package:flutter/cupertino.dart';
import 'package:movie_night_flutter/model/movide_model.dart';

enum CardStatus { like, dislike }

class CardProvider extends ChangeNotifier {
  List<Result> dislikedMovies = [];
  List<Result> movies = [];
  List<Result> likedMovies = [];
  int countPages = 1;
  Offset _position = Offset.zero;
  bool _isDragging = false;
  Size _screenSize = Size.zero;
  double _angle = 0;

  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;
  List<Result> get getMovies => movies;

  void setMovies(List<Result> movies) {
    this.movies.addAll(movies.reversed);
  }

  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void setScreenSize(Size size) {
    _screenSize = size;
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
    switch (status) {
      case CardStatus.like:
        like();
        break;
      default:
        resetPosition();
    }
  }

  CardStatus? getStatus() {
    final x = _position.dx;
    const delta = 100;

    if (x >= delta) {
      return CardStatus.like;
    }
  }

  void resetPosition() {
    _angle = 0;
    _isDragging = false;
    _position = Offset.zero;
    notifyListeners();
  }

  void like() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);
    _nextCard();
    notifyListeners();
  }

  Future _nextCard() async {
    // if (provider.isEmpty) return;
    // await Future.delayed(const Duration(milliseconds: 200));
    // provider.removeLast();
    // resetPosition();
  }
}
