import 'package:flutter/services.dart';
import 'dart:async';

import 'package:platform_device_id/platform_device_id.dart';

class HTTPHelperMovieNight {
  Future<Map> getMySessionID(String deviceID) async {
    String _url =
        'https://movie-night-api.onrender.com/start-session?device_id=$deviceID';
    Map data = {
      "data": {"message": "error", "code": "0000", "session_id": "null"}
    };

    return data;
  }

  Future<String> initPlatformState() async {
    String? deviceId;
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }

    return deviceId!;
  }
}
