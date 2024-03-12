import 'package:bonfire/bonfire.dart';

import 'package:cleaning_my_home/controller/blocks_controller.dart';
import 'package:cleaning_my_home/controller/timer_controller.dart';
import 'package:cleaning_my_home/util/sounds.dart';
import 'package:cleaning_my_home/util/commom_sprite_sheet.dart';

class Blocks extends GameDecoration with Sensor {
  late BlocksNumberController controllerBlocksNumber;
  late TimerController controllerTimer;
  final int additionalTime = 15;

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

    // inicialização da variavel de controle do tempo
    controllerTimer = TimerController();

    return super.onLoad();
  }

  @override
  void onMount() {
    controllerBlocksNumber = BlocksNumberController();
    controllerBlocksNumber.configure(maxBlocks: 5);

    super.onMount();
  }

  @override
  void onContact(GameComponent component) {
    if (component is Player) {
      // debugPrint('onContact player no block ');

      Sounds.blockPop();

      removeFromParent();

      int numeroBlocos = gameRef.query<Blocks>().length - 1;

      controllerBlocksNumber = BlocksNumberController();
      controllerBlocksNumber.blocksNumber = numeroBlocos;

      // aumenta 30s por bloco pego
      controllerTimer.remainingTime += additionalTime;

      // debugPrint(
      //     'Blocks onContact: numero de blocos no controller ${controllerBlocksNumber.blocksNumber}');
    }

    super.onContact(component);
  }
}
