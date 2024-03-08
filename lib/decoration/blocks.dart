import 'package:flutter/material.dart';

import 'package:bonfire/bonfire.dart';

import 'package:cleaning_my_home/util/blocks_controller.dart';
import 'package:cleaning_my_home/util/commom_sprite_sheet.dart';

class Blocks extends GameDecoration with Sensor {
  late BlocksNumberController controller;

  Blocks(Vector2 position)
      : super.withSprite(
          sprite: CommomSpritesheet.blockSprite,
          position: position,
          size: Vector2(32, 32),
        );

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(
      size: Vector2(28, 28),
      position: Vector2(2, 2),
    ));

    int numeroBlocos = gameRef.query<Blocks>().length;

    controller = BlocksNumberController();
    controller.blocksNumber = numeroBlocos;

    // debugPrint('Blocks onLoad = ${controller.blocksNumber.toString()}');

    return super.onLoad();
  }

  @override
  void onMount() {
    controller = BlocksNumberController();
    controller.configure(maxBlocks: 5);

    // debugPrint('Mount Block = ${gameRef.query<Blocks>().length}');

    super.onMount();
  }

  @override
  void onContact(GameComponent component) {
    if (component is Player) {
      debugPrint('onContact player no block ');

      removeFromParent();
    }

    int numeroBlocos = gameRef.query<Blocks>().length - 1;

    controller = BlocksNumberController();
    controller.blocksNumber = numeroBlocos;

    // debugPrint('onContact = ${controller.blocksNumber.toString()}');
    // debugPrint('onContact Block = ${gameRef.query<Blocks>()}');

    super.onContact(component);
  }
}
