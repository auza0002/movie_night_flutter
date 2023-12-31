// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:movie_night_flutter/utils/http_helper_movie_ninght.dart';

enum GameMatchStatus { match, noMatch }

class GameProvider with ChangeNotifier {
  String _myDeviceID = '';
  String _myKey = '';
  String _mySessionID = '';
  String _sessionID = '';
  String _roomID = '';
  String _roomOwner = '';
  String _match = "";
  GameMatchStatus _gameStatus = GameMatchStatus.noMatch;

  GameMatchStatus get getStatus => _gameStatus;
  String get getMySessionID => _mySessionID;
  String get getMyDeviceID => _myDeviceID;
  String get getMyKey => _myKey;
  String get getSessionID => _sessionID;
  String get getRoomID => _roomID;
  String get getRoomOwner => _roomOwner;
  String get getMatch => _match;
  Future<bool> joinSession(String code) async {
    var response = await HTTPHelperMovieNight().joinSession(_myDeviceID, code);
    if (response != "") {
      _sessionID = response;
      notifyListeners();

      return true;
    } else {
      return false;
    }
  }

  void initialGameStatus() {
    _gameStatus = GameMatchStatus.noMatch;
    notifyListeners();
  }

  void voteMovie(
    String movieID,
    bool vote,
  ) async {
    String sessionID = "";
    if (_roomOwner == "host") {
      sessionID = _mySessionID;
    } else {
      sessionID = _sessionID;
    }
    var response =
        await HTTPHelperMovieNight().voteMovie(sessionID, movieID, vote);
    if (response['data']['match'] == true) {
      _match = response['data']['movie_id'];
      _gameStatus = GameMatchStatus.match;
    } else {
      _gameStatus = GameMatchStatus.noMatch;
    }

    notifyListeners();
  }

  void setMyKey(String myDeivce) async {
    var response = await HTTPHelperMovieNight().getMySessionID(myDeivce);
    _myKey = response['data']['code'];
    _mySessionID = response['data']['session_id'];
    notifyListeners();
  }

  void setDeviceID() async {
    var deviceID = await HTTPHelperMovieNight().initPlatformState();
    _myDeviceID = deviceID;
    notifyListeners();
  }

  void setRoomOwner(String owner) {
    _roomOwner = owner;
    notifyListeners();
  }
}
