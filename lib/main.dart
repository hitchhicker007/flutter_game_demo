import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("void main called!");
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame with DoubleTapDetector {
  SpriteComponent boy = SpriteComponent();
  bool running = true;
  String direction = 'forward';
  SpriteAnimationComponent boyAnimation = SpriteAnimationComponent();

  // Size size = await Flame.util.

  @override
  Future<void>? onLoad() async {
    Size size = await Flame.util.initialDimensions();
    print('on load called');

    var bgSpSheet = await images.load('BG.png');
    // final bgSpriteSize = Vector2(120, 130);
    SpriteAnimationData spriteAnimationData = SpriteAnimationData.sequenced(
        amount: 8, stepTime: 0.07, textureSize: Vector2(150, 163));
    boyAnimation =
        SpriteAnimationComponent.fromFrameData(Vector2(), spriteAnimationData)
          ..x = 0
          ..y = 600
          ..size = spriteSize;
    add(boyAnimation);

    SpriteComponent land = SpriteComponent()
      ..sprite = await loadSprite('land-1.png')
      ..size = Vector2(100, 100)
      ..position = Vector2(0, 700);
    add(land);

    var spriteSheet = await images.load('boy-run.png');
    final spriteSize = Vector2(120, 130);
    SpriteAnimationData spriteAnimationData = SpriteAnimationData.sequenced(
        amount: 8, stepTime: 0.07, textureSize: Vector2(150, 163));
    boyAnimation =
        SpriteAnimationComponent.fromFrameData(spriteSheet, spriteAnimationData)
          ..x = 0
          ..y = 600
          ..size = spriteSize;
    add(boyAnimation);
  }

  // @ove
}
