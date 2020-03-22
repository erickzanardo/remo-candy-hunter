import 'package:flame/game.dart';
import 'package:flame_scrolling_sprite/flame_scrolling_sprite.dart';
import 'dart:ui';

import './components/player.dart';
import './components/enemy_creator.dart';
import './components/candy_creator.dart';
import './components/score.dart';

class GrowthGame extends BaseGame {
  Player player;
  double playerMinY;

  int score = 0;

  GrowthGame(Size _size) {
    size = _size;

    add(EnemyCreator());
    add(CandyCreator());


    add(ScrollingSpriteComponent(
      scrollingSprite: ScrollingSprite(
        spritePath: 'background.png',
        width: size.width,
        spriteDestWidth: size.width,
        spriteDestHeight: size.height,
        horizontalSpeed: -20,
      ),
      y: 0,
      x: 0,
    ));

    add(ScrollingSpriteComponent(
      scrollingSprite: ScrollingSprite(
        spritePath: 'ground.png',
        width: size.width,
        spriteDestWidth: size.width,
        spriteDestHeight: 20,
        horizontalSpeed: -50,
      ),
      y: size.height - 20,
      x: 0,
    ));

    add(player = Player()
        ..y = playerMinY = size.height - (Player.HEIGHT + 20)
        ..x = 50
    );

    add(Score());
  }

  void growPress() {
    player.growPress();
  }

  void growRelease() {
    player.growRelease();
  }

  void shrinkPress() {
    player.shrinkPress();
  }

  void shrinkRelease() {
    player.shrinkRelease();
  }

  void increaseScore() {
    score++;
  }

  void resetScore() {
    score = 0;
  }
}

