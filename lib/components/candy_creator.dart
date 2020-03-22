import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/time.dart';

import 'dart:ui';
import 'dart:math';

import '../game.dart';

import './candy.dart';

class CandyCreator extends Component with HasGameRef<GrowthGame>{

  Timer candyCreator;

  Random random = Random();

  CandyCreator() {
    candyCreator = Timer(3.0, repeat: true, callback: () {
      gameRef.add(
          Candy()
          ..x = gameRef.size.width
          ..y = min((gameRef.playerMinY - Candy.HEIGHT), gameRef.size.height * random.nextDouble())
      );
    });
    candyCreator.start();
  }

  @override
  void update(double dt) {
    candyCreator.update(dt);
  }

  @override
  void render(Canvas canvas) { }
}
