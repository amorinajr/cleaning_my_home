import 'package:flutter/material.dart';

import 'package:bonfire/bonfire.dart';

import 'package:cleaning_my_home/util/commom_sprite_sheet.dart';

class RecycleBin extends GameDecoration with Sensor {
  RecycleBin(Vector2 position)
      : super.withSprite(
          sprite: CommomSpritesheet.recyclebinSprite,
          position: position,
          size: Vector2(64, 64),
        );

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(
      size: Vector2(54, 60),
      position: Vector2(5, 2),
    ));

    return super.onLoad();
  }

  // @override
  // void onMount() {
  //   debugPrint('on moount no recyclebin ');
  //   super.onMount();
  // }

  @override
  void onContact(GameComponent component) {
    if (component is Player) {
      debugPrint('onContact player no recyclebin ');
    }

    // debugPrint('entro no oncontact ');
    // debugPrint('onContact Block = ${gameRef.query<Blocks>()}');

    super.onContact(component);
  }
}
