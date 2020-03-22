import 'package:flame/text_config.dart';
import 'package:flame/components/text_component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';

import 'dart:ui';

import '../game.dart';

class Score extends TextComponent with HasGameRef<GrowthGame> {
  Score() : super(
      "Score 0",
      config: TextConfig(color: Color(0xffffffff))
  ) {
    x = y = 5;
  }

  @override
  void update(double dt) {
    text = "Score ${gameRef.score}";
  }
}
