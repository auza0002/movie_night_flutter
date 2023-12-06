import 'package:flutter/material.dart';
import 'package:movie_night_flutter/screen_controller.dart';
import 'package:movie_night_flutter/utils/http_helper_tmdb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    HTTPHelperTMDB().getDataPrimaryList();
  }

  @override
  Widget build(BuildContext context) {
    return const ScreenController();
  }
}
