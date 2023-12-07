import 'package:flutter/cupertino.dart';
import 'package:movie_night_flutter/utils/http_helper_movie_ninght.dart';

class GameProvider with ChangeNotifier {
  String _myDeviceID = '';
  String _myKey = '';
  String _url = '';

  void getDeviceID() async {
    var deviceID = await HTTPHelperMovieNight().initPlatformState();
    _myDeviceID = deviceID;
    print('Device ID: $_myDeviceID');
    notifyListeners();
  }
}
