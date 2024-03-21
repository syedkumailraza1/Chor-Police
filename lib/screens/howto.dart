import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/chor_police.dart';
import 'package:flutter/material.dart';

class HowtoScreen extends StatelessWidget {

  final FlappyBirdGame game;
    static const String id = 'Howto';
  const HowtoScreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.black38,
        child: Center(
          child: Container(
             width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.howto),
              fit: BoxFit.cover,
            ),
          ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
            
                SizedBox(height: 350),
                ElevatedButton(
                  onPressed: onRestart,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text(
                    'Back',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      );



  void onRestart() {
    game.overlays.remove('Howto');
  }
}
