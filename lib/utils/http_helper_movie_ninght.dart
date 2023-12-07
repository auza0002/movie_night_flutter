import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';

import 'package:platform_device_id/platform_device_id.dart';

class HTTPHelperMovieNight {
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
