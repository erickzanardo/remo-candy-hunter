import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/flame.dart';
import 'package:flutter/foundation.dart';
import 'game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final gameScreenSize = Size(500, 300);
  final game = GrowthGame(gameScreenSize);

  if (!kIsWeb) {
    await Flame.util.fullScreen();
  } else {
    RawKeyboard.instance.addListener((e) {
      if (e is RawKeyDownEvent) {
        if(e.data.keyLabel == "a") {
          game.growPress();
        } else if (e.data.keyLabel == "d") {
          game.shrinkPress();
        }
      } else {
        if(e.data.keyLabel == "a") {
          game.growRelease();
        } else if (e.data.keyLabel == "d") {
          game.shrinkRelease();
        }
      }
    });
  }

  runApp(MaterialApp(
      home: Scaffold(
          body: Container(color: Color(0xFF000000), child:
              Stack(children: [
                Center(child:
                    Container(
                        width: gameScreenSize.width,
                        height: gameScreenSize.height,
                        child: ClipRect(child: game.widget),
                    ),
                ),
                Positioned(
                    left: 20,
                    top: 70,
                    child: GestureDetector(
                        onTapDown: (_) {
                          game.growPress();
                        },
                        onTapUp: (_) {
                          game.growRelease();
                        },
                        child: Opacity(opacity: kIsWeb ? 0 : 1, child: Container(
                            width: 70,
                            height: 70,
                            color: Color(0xFF1f6a8c),
                        )),
                    ),
                ),
                Positioned(
                    right: 20,
                    top: 70,
                    child: GestureDetector(
                        onTapDown: (_) {
                          game.shrinkPress();
                        },
                        onTapUp: (_) {
                          game.shrinkRelease();
                        },
                        child: Opacity(opacity: kIsWeb ? 0 : 1, child: Container(
                            width: 70,
                            height: 70,
                            color: Color(0xFF3b9471),
                        )),
                    ),
                ),
              ]),
          ),
      ),
  ));
}
