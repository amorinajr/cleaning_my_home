import 'package:flutter/material.dart';

import 'package:bonfire/bonfire.dart';

import 'package:cleaning_my_home/controller/blocks_controller.dart';
import 'package:cleaning_my_home/controller/timer_controller.dart';

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
                      controller.blocksNumber.toString(),
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
                      timerController.remainingTime > 500
                          ? '0'
                          : timerController.remainingTime.toString(),
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
