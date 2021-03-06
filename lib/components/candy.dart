import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'dart:ui';

import '../game.dart';

class Candy extends SpriteComponent with HasGameRef<GrowthGame> {

  static const double SPEED = -40;

  static const double HEIGHT = 20;
  static const double WIDTH = 20;

  bool destroyed = false;

  Candy(): super.rectangle(WIDTH, HEIGHT, "candy.png") {
    width = WIDTH;
    height = HEIGHT;
  }

  @override
  void update(double dt) {
    x += SPEED * dt;

    if (toRect().overlaps(gameRef.player.toRect())) {
      destroyed = true;
      gameRef.increaseScore();
    }
  }

  @override
  bool destroy() => destroyed;
}

