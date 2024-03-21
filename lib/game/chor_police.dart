import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird_game/components/background.dart';
import 'package:flappy_bird_game/components/bird.dart';
import 'package:flappy_bird_game/components/ground.dart';
import 'package:flappy_bird_game/components/pipe_group.dart';
import 'package:flappy_bird_game/game/configuration.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';


class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection, WidgetsBindingObserver {
  FlappyBirdGame();

  late Bird bird;
  Timer interval = Timer(Config1.pipeInterval, repeat: true);
  bool isHit = false;
  late TextComponent score;
  late TextComponent levelText; 
  late AudioPlayer musicPlayer;

  bool get pendingPipe => true;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Load music
    musicPlayer = await FlameAudio.loopLongAudio('music.mp3', volume: 0.5);

      // Add observer for lifecycle events
    WidgetsBinding.instance?.addObserver(this);
   
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
      levelText = buildLevelText(), // Add the level text
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void dispose() {
    // Stop the music when the game is disposed
    musicPlayer.dispose();

    // Remove observer for lifecycle events
    WidgetsBinding.instance?.removeObserver(this);

    
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Handle pause and resume events
    if (state == AppLifecycleState.paused) {
      // Pause audio when the app is paused
      musicPlayer.stop();
    } else if (state == AppLifecycleState.resumed) {
      // Resume audio when the app is resumed
      musicPlayer.resume();
    }
  }

  TextComponent buildScore() {  
    return TextComponent(
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
            fontSize: 40, fontFamily: 'Game', fontWeight: FontWeight.bold),
      ),
    );
  }

  TextComponent buildLevelText() {
    return TextComponent(
      position:
          Vector2(size.x / 2, size.y / 2 * 0.9), // Adjust position as needed
      anchor: Anchor.center,
     textRenderer: TextPaint(
        style: const TextStyle(
            fontSize: 40, fontFamily: 'Game', fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  void onTap() {
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Points: ${bird.score}';

    print('Current Score: ${bird.score}');

    if (bird.score == 10) {
      print('Level 2');
      levelText.text = 'Level 2';
    } else if (bird.score == 15) {
      print('Level 3');
      levelText.text = 'Level 3';
    } else if (bird.score == 25) {
      print('Level 4');
      levelText.text = 'Level 4';
    } else {
      print('No level change');
      levelText.text = '';
    }
  }
}
