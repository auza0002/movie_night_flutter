import 'package:flutter/material.dart';
import 'package:movie_night_flutter/providers/movives_home_provider.dart';
import 'package:movie_night_flutter/screen_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MoviesProvider()),
  ], child: const MyApp()));
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
    context.read<MoviesProvider>().getDataHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const ScreenController();
  }
}
