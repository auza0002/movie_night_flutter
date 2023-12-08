// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:movie_night_flutter/utils/http_helper_movie_ninght.dart';

class GameProvider with ChangeNotifier {
  String _myDeviceID = '';
  String _myKey = '';
  String _sessionID = '';
  String _roomID = '';
  bool _isHost = false;

//start-session?device_id=123

  String get getMyDeviceID => _myDeviceID;
  String get getMyKey => _myKey;
  String get getSessionID => _sessionID;
  String get getRoomID => _roomID;
  bool get getIsHost => _isHost;

  void setIsHost(bool isHost) async {
    var host = await HTTPHelperMovieNight().joinSession(_myDeviceID, _myKey);
    _isHost = host;
    notifyListeners();
  }

  void setMyKey(String myDeivce) async {
    var myKey = await HTTPHelperMovieNight().getMySessionID(myDeivce);
    _myKey = myKey['data']['code'];
    _sessionID = myKey['data']['session_id'];
    notifyListeners();
  }

  void getDeviceID() async {
    var deviceID = await HTTPHelperMovieNight().initPlatformState();
    _myDeviceID = deviceID;
    notifyListeners();
  }

  void setSessionID(String sessionID) {
    _sessionID = sessionID;
    notifyListeners();
  }
}
