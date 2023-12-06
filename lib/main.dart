import 'package:flutter/material.dart';
import 'package:movie_night_flutter/screen_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenController();
  }
}
