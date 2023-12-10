import 'package:flutter/cupertino.dart';
import 'package:movie_night_flutter/model/movide_model.dart';

class CardProvider extends ChangeNotifier {
  List<Result> likedMovies = [];
  Offset _position = Offset.zero;
  bool _isDragging = false;
  Size _screenSize = Size.zero;
  double _angle = 0;

  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;

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
    resetPosition();
  }

  void resetPosition() {
    _angle = 0;
    _isDragging = false;
    _position = Offset.zero;
    notifyListeners();
  }
}
