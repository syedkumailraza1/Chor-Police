import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
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
    game.pauseEngine();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.menu),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(children: [
          SizedBox(
            width: 350,
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 50),
            child: Text(
              "Chor-चिट्ठी",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 200, left: 80),
            child: Expanded(
                child: Column(
              children: [
                SizedBox(
                  width: 200, 
                  child: ElevatedButton(
                    onPressed: () {
                      print("Removing overlay.");
                      print("Resuming game.");
          game.overlays.remove('mainMenu');
          game.resumeEngine();
                    },
                    child: Text("Start",
                        style: TextStyle(backgroundColor: Colors.transparent)),
                  ),
                ),
                SizedBox(height: 10,),
                   SizedBox(
                  width: 200,  
                  child: ElevatedButton(
                   onPressed: () {
              showDialog(
                context: context,
                builder: (context) => HowToPlayDialog(),
              );
            },
                    child: Text("How To Play",
                        style: TextStyle(backgroundColor: Colors.transparent)),
                  ),
                )
              ],
            )),
          ),
        ]),
      ),
    );
  }
}

class HowToPlayDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        child: Image.asset(Assets.howto), // Replace with your image asset
      ),
    );
  }
}