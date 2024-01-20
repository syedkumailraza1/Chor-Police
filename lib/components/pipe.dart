
import
 
'dart:math';

import
 
'package:flame/collisions.dart';
import
 
'package:flame/components.dart';
import
 
'package:flame/flame.dart';
import
 
'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/configuration.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flappy_bird_game/game/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({
    required this.pipePosition,
    required this.height,
    Vector2? position,
  });

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);

    // Assign the sprite here
    sprite = Sprite(pipe);

    size = Vector2(100, 100);

    // Generate Y position, ensuring no overlap with existing pipes
    double randomYPosition;
    bool validPositionFound = false;

    do {
      randomYPosition = Random().nextDouble() * (gameRef.size.y);

      // Check for overlap with existing pipes
      final allPipes = gameRef.children.whereType<Pipe>();
      bool overlaps = false;

      for (final pipe in allPipes) {
        if ((pipe.pipePosition == PipePosition.top &&
                pipe.position.y + pipe.height > randomYPosition) ||
            (pipe.pipePosition == PipePosition.bottom &&
                pipe.position.y < randomYPosition + height)) {
          overlaps = true;
          break;
        }
      }

      // Ensure alternating pipe positions
      if (!overlaps &&
          (allPipes.isEmpty ||
              allPipes.last.pipePosition != pipePosition)) {
        validPositionFound = true;
      }

    } while (!validPositionFound ||
        randomYPosition < 0 ||
        randomYPosition > gameRef.size.y - height - Config1.groundHeight);

    position.y = randomYPosition;

    // Add the pipe and hitbox
    add(RectangleHitbox());
    print("Pipe added");
  }
}









