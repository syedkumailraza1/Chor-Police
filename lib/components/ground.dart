import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird_game/game/configuration.dart';
import 'package:flappy_bird_game/game/chor_police.dart';

class Ground extends PositionComponent with HasGameRef<FlappyBirdGame> {
  @override
  Future<void> onLoad() async {
    var size = Vector2(gameRef.size.x, Config1.groundHeight);
    var position =  Vector2(0, gameRef.size.y - Config1.groundHeight);
    add(RectangleHitbox(size: size,position: position )); // Add the hitbox
  }
}