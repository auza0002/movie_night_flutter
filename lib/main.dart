import 'package:flutter/material.dart';
import 'package:movie_night_flutter/providers/card_provider.dart';
import 'package:movie_night_flutter/providers/game_provider.dart';
import 'package:movie_night_flutter/providers/movive_provider.dart';
import 'package:movie_night_flutter/screen_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => CardProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => MoviesProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => GameProvider(),
    ),
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
    context.read<MoviesProvider>().setMovies();
    context.read<GameProvider>().setDeviceID();
    context
        .read<GameProvider>()
        .setMyKey(context.read<GameProvider>().getMyDeviceID);
  }

  @override
  Widget build(BuildContext context) {
    return const ScreenController();
  }
}
