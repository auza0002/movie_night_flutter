import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:async';

class HTTPHelperMovieNight {
  Future<String> joinSession(String deviceID, String code) async {
    String sessionFound = "";
    String url =
        'https://movie-night-api.onrender.com/join-session?device_id=$deviceID&code=$code';
    Uri uri = Uri.parse(url);
    Response response = await get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> dataJSON = jsonDecode(response.body);
      if (dataJSON['data']['message'] != 'no match for code.') {
        sessionFound = dataJSON['data']['session_id'];
      }
    }
    return sessionFound;
  }

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

  Future<Map> voteMovie(String sessionID, String movieID, bool vote) async {
    String url =
        'https://movie-night-api.onrender.com/vote-movie?session_id=$sessionID&movie_id=$movieID&vote=$vote';
    Map<String, dynamic> data = {
      "data": {
        "message": "error",
        "movie_id": "00000",
        "Boolean": "false",
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

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<String> initPlatformState() async {
    String? deviceId;
    try {
      if (Platform.isIOS) {
        deviceId = await deviceInfoPlugin.iosInfo
            .then((value) => value.identifierForVendor);
      } else if (Platform.isAndroid) {
        deviceId = await deviceInfoPlugin.androidInfo.then((value) => value.id);
      } else {
        throw UnsupportedError('Unsupported platform');
      }
    } on PlatformException {
      throw Exception('Failed to get platform version');
    }
    return deviceId!;
  }
}
