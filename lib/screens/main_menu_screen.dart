import 'package:flame/flame.dart';
import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/chor_police.dart';
import 'package:flappy_bird_game/screens/howto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';

  const MainMenuScreen({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Pause the game engine when MainMenuScreen is displayed
    game.pauseEngine();

    return Scaffold(
      body: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.menu),
                fit: BoxFit.cover,
              ),
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Game title
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Text(
                  "Chor Police",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              // Buttons
              Container(
                margin: const EdgeInsets.only(top: 50), // Adjusted margin
                child: Column(
                  children: [
                    // Start Button
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Removing overlay.");
                          print("Resuming game.");
                          // Remove MainMenuScreen overlay and resume game
                          game.overlays.remove('mainMenu');
                          game.resumeEngine();
                        },
                        child: Text(
                          "Start",
                          style: TextStyle(backgroundColor: Colors.transparent),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // How To Play Button
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          game.overlays.add('Howto');
                        },
                        child: Text(
                          "How To Play",
                          style: TextStyle(backgroundColor: Colors.transparent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


