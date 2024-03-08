import 'package:cleaning_my_home/util/timer_controller.dart';
import 'package:flutter/material.dart';

import 'package:bonfire/bonfire.dart';

import 'package:cleaning_my_home/util/blocks_controller.dart';

class Interface extends GameInterface {
  @override
  void onMount() async {
    add(BlocksInterface());
    // add(TimerInterface());
    super.onMount();
  }
}

class BlocksInterface extends InterfaceComponent {
  BlocksInterface()
      : super(
          id: 1,
          position: Vector2(20, 20),
          size: Vector2(64, 32),
          spriteUnselected: Sprite.load('block-number.png'),
        );
}

class BlocksCounterInterface extends StatelessWidget {
  const BlocksCounterInterface({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocksNumberController();
    return Material(
      type: MaterialType.transparency,
      child: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 65, top: 21),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      controller.blocksNumber.toInt().toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Mostrar o Timer na tela

class TimerInterface extends StatelessWidget {
  const TimerInterface({super.key});

  @override
  Widget build(BuildContext context) {
    final timerController = TimerController();
    debugPrint('Enntro no TimerInterface');

    return Material(
      type: MaterialType.transparency,
      child: ListenableBuilder(
        listenable: timerController,
        builder: (context, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 130, top: 21),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      timerController.countDown.current.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
