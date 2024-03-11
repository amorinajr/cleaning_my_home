import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bonfire/bonfire.dart';

import 'package:cleaning_my_home/controller/blocks_controller.dart';
import 'package:cleaning_my_home/util/commom_sprite_sheet.dart';
import 'package:cleaning_my_home/util/custom_sprite_animation_widget.dart';
import 'package:cleaning_my_home/util/sounds.dart';
import 'package:cleaning_my_home/decoration/blocks.dart';

class RecycleBin extends GameDecoration with Sensor {
  bool crabContact = false;
  late BlocksNumberController blockControler;

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

  @override
  void onContactExit(GameComponent component) {
    if (component is Player) {
      crabContact = false;
      debugPrint(
          'onContact player não está no recyclebin - crabContact = $crabContact ');
    }

    super.onContactExit(component);
  }

  @override
  void onContact(GameComponent component) {
    bool containBlocks = gameRef.query<Blocks>().isNotEmpty;

    if (component is Player) {
      if (containBlocks && !crabContact) {
        component.stopMove();

        debugPrint('onContact player no recyclebin ');

        gameRef.pauseEngine();

        Sounds.talking();
        TalkDialog.show(
          gameRef.context,
          [
            Say(
              text: [
                const TextSpan(
                  text: 'Você ainda não pegou todos os blocos, procure mais!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
              person: CustomSpriteAnimationWidget(
                animation: TalkSpriteSheet.crabTalking(),
              ),
              personSayDirection: PersonSayDirection.RIGHT,
            ),
          ],
          onChangeTalk: (index) {
            Sounds.talking();
          },
          onFinish: () {
            gameRef.resumeEngine();
            crabContact = true;
          },
          logicalKeyboardKeysToNext: [
            LogicalKeyboardKey.space,
          ],
        );
      } else if (!containBlocks && !crabContact) {
        debugPrint('onContact todos os blocs');

        Sounds.blockRecycleBinPop();

        blockControler = BlocksNumberController();
        blockControler.blocksBin = true;
        crabContact = true;

        debugPrint('voltou para o recycle bin');
        debugPrint('----');
      }
    }

    super.onContact(component);
  }
}
