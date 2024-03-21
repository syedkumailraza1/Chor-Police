import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_game/game/chor_police.dart';
import 'package:flappy_bird_game/screens/howto.dart';
import 'package:flappy_bird_game/screens/main_menu_screen.dart';
import 'package:flappy_bird_game/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/game_over_screen.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  final game = FlappyBirdGame();

  runApp(
    MaterialApp(
      home: MySplashScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );

  // Wait for a few seconds or perform initialization tasks
  await Future.delayed(Duration(seconds: 10));

  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'gameOver': (context, _) => GameOverScreen(game: game),
        'Howto': (context, _) => HowtoScreen(game: game),
      },
    ),
  );
}
