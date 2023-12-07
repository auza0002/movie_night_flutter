import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:async';

import 'package:platform_device_id/platform_device_id.dart';

class HTTPHelperMovieNight {
  Future<Map> getMySessionID(String deviceID) async {
    String url =
        'https://movie-night-api.onrender.com/start-session?device_id=$deviceID';
    Map<String, dynamic> data = {
      "data": {
        "message": "error",
        "code": "0000",
        "session_id": "null",
      }
    };
    Uri uri = Uri.parse(url);
    Response response = await get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> dataJSON = jsonDecode(response.body);
      data = dataJSON;
    }
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
