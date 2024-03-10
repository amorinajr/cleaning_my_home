import 'dart:async';

import 'package:bonfire/bonfire.dart';

class CommomSpritesheet {
  SimpleDirectionAnimation simpleAnimation() {
    return SimpleDirectionAnimation(
      idleDown: getIdleDown,
      idleRight: getIdleRight,
      idleUp: getIdleUp,
      runRight: getRunRight,
      runLeft: getRunLeft,
      runUp: getRunUp,
      runDown: getRunDown,
      runUpLeft: getRunUpLeft,
      runUpRight: getRunUpRight,
    );
  }

  Future<SpriteAnimation> get getIdleDown {
    return SpriteAnimation.load(
      "player/crab-iddle-front.png",
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.4,
        textureSize: Vector2.all(64),
      ),
    );
  }

  Future<SpriteAnimation> get getIdleRight {
    return SpriteAnimation.load(
      "player/crab-iddle-front.png",
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.4,
        textureSize: Vector2.all(64),
      ),
    );
  }

  get getRunRight {
    return SpriteAnimation.load(
      "player/crab-walking-front-right.png",
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.2,
        textureSize: Vector2.all(64),
      ),
    );
  }

  get getIdleUp {
    return SpriteAnimation.load(
      "player/crab-iddle-back.png",
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.2,
        textureSize: Vector2.all(64),
      ),
    );
  }

  get getRunLeft {
    return SpriteAnimation.load(
      "player/crab-walking-front-left.png",
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.2,
        textureSize: Vector2.all(64),
      ),
    );
  }

  get getRunUp {
    return SpriteAnimation.load(
      "player/crab-walking-back.png",
      SpriteAnimationData.sequenced(
        amount: 5,
        stepTime: 0.2,
        textureSize: Vector2.all(64),
      ),
    );
  }

  get getRunDown {
    return SpriteAnimation.load(
      "player/crab-walking-front.png",
      SpriteAnimationData.sequenced(
        amount: 5,
        stepTime: 0.2,
        textureSize: Vector2.all(64),
      ),
    );
  }

  get getRunUpLeft {
    return SpriteAnimation.load(
      "player/crab-walking-back-left.png",
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.2,
        textureSize: Vector2.all(64),
      ),
    );
  }

  get getRunUpRight {
    return SpriteAnimation.load(
      "player/crab-walking-back-right.png",
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.2,
        textureSize: Vector2.all(64),
      ),
    );
  }

  static Future<Sprite> get blockSprite => Sprite.load('items/block.png');
  static Future<Sprite> get recyclebinSprite =>
      Sprite.load('items/recyclebin.png');
}

class TalkSpriteSheet {
  static Future<SpriteAnimation> crabTalking() => SpriteAnimation.load(
        'player/crab-iddle-front.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.4,
          textureSize: Vector2.all(64),
        ),
      );
}
