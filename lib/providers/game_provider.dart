// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:movie_night_flutter/utils/http_helper_movie_ninght.dart';

class GameProvider with ChangeNotifier {
  String _myDeviceID = '';
  String _myKey = '';
//start-session?device_id=123

  String get getMyDeviceID => _myDeviceID;
  String get getMyKey => _myKey;

  void getDeviceID() async {
    var deviceID = await HTTPHelperMovieNight().initPlatformState();
    _myDeviceID = deviceID;
    notifyListeners();
  }
}
