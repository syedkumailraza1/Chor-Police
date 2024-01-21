import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/configuration.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flappy_bird_game/game/pipe_position.dart';
import 'package:flappy_bird_game/components/pipe.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config1.groundHeight;
    final spacing = 50 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spacing + _random.nextDouble() * (heightMinusGround - spacing);

    add(
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing / 2),
    );
  }

  void updateScore() {
    gameRef.bird.score += 1;
    FlameAudio.play(Assets.point);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (game.bird.score <= 9) {
      position.x -= Config1.gameSpeed * dt;
    } else if (game.bird.score >= 10 && game.bird.score <= 14) {
      position.x -= Config2.gameSpeed * dt;
    } else if (game.bird.score >= 15 && game.bird.score <= 24) {
      position.x -= Config3.gameSpeed * dt;
    } else if (game.bird.score >= 25) {
      position.x -= Config4.gameSpeed * dt;
    }

    if (position.x < -10) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }
}
