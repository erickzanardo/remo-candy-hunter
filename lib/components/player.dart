import 'package:flame/sprite.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'dart:ui';
import 'dart:math';

import '../game.dart';

class Player extends PositionComponent with HasGameRef<GrowthGame> {

  static const double MAX_HEIGHT = 100;
  static const double HEIGHT = 50;
  static const double WIDTH = 30;

  static const double RATE = 70;
  static const double FLOAT_RATE = -100;

  bool growing = false;
  bool shrinking = false;

  final sprite = Sprite("remo.png");
  final spriteInflating = Sprite("remo_inflating.png");
  final spriteShrinking = Sprite("remo_shrinking.png");

  Player() {
    width = WIDTH;
    height = HEIGHT;
  }

  @override
  void update(double dt) {
    if (growing && height < MAX_HEIGHT) {
      width += RATE * dt;
      height += RATE * dt;
      y -= RATE * dt;
    }

    if (shrinking && height > HEIGHT) {
      width -= RATE * dt;
      height -= RATE * dt;
      y += RATE * dt;
    }

    final inflation = (height - HEIGHT);

    if (inflation <= 0) {
      y += 100 * dt;
    } else {
      y -= inflation * dt;
    }

    y = min(gameRef.playerMinY, y);
    y = max(0, y);
  }

  @override
  void render(Canvas canvas) {
    if (growing) {
      spriteInflating.renderRect(canvas, toRect());
    } else if (shrinking) {
      spriteShrinking.renderRect(canvas, toRect());
    } else {
      sprite.renderRect(canvas, toRect());
    }
  }

  void growPress() {
    growing = true;
  }

  void growRelease() {
    growing = false;
  }

  void shrinkPress() {
    shrinking = true;
  }

  void shrinkRelease() {
    shrinking = false;
  }
}
