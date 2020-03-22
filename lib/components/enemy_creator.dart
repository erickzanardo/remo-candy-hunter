import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/time.dart';

import 'dart:ui';
import 'dart:math';

import '../game.dart';

import './enemy.dart';

class EnemyCreator extends Component with HasGameRef<GrowthGame>{

  Timer enemyCreator;

  Random random = Random();

  EnemyCreator() {
    enemyCreator = Timer(6.0, repeat: true, callback: () {
      gameRef.add(
          Enemy()
          ..x = gameRef.size.width
          ..y = min((gameRef.playerMinY - Enemy.HEIGHT), gameRef.size.height * random.nextDouble())
      );
    });
    enemyCreator.start();
  }

  @override
  void update(double dt) {
    enemyCreator.update(dt);
  }

  @override
  void render(Canvas canvas) { }
}
