// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:movie_night_flutter/utils/http_helper_movie_ninght.dart';

class GameProvider with ChangeNotifier {
  String _myDeviceID = '';
  String _myKey = '';
  String _sessionID = '';

//start-session?device_id=123

  String get getMyDeviceID => _myDeviceID;
  String get getMyKey => _myKey;

  void setMyKey(String myDeivce) async {
    var myKey = await HTTPHelperMovieNight().getMySessionID(myDeivce);
    _myKey = myKey['data']['code'];
    _sessionID = myKey['data']['session_id'];
    print("my key $_myKey");
    notifyListeners();
  }

  void getDeviceID() async {
    var deviceID = await HTTPHelperMovieNight().initPlatformState();
    _myDeviceID = deviceID;
    notifyListeners();
  }
}
