import 'dart:async';

import 'package:cleaning_my_home/util/timer_controller.dart';
import 'package:flutter/material.dart';

import 'package:bonfire/bonfire.dart';

import 'package:cleaning_my_home/decoration/blocks.dart';

class GameController extends GameComponent {
  bool showWin = false;

// Código para controle do tempo
  // final TextPaint textPaint = TextPaint(
  //   style: const TextStyle(
  //     color: Colors.black,
  //     fontSize: 22,
  //     backgroundColor: Colors.white,
  //   ),
  // );
  final countdown = Timer(20);
  final timerController = TimerController();

  @override
  FutureOr<void> onLoad() {
    timerController.countDown = countdown;
    return super.onLoad();
  }

// *********

  @override
  void update(double dt) {
// Código para controle do tempo
    countdown.update(dt);
    timerController.countDown = countdown;
    debugPrint("Countdown: ${countdown.current.toString()}");
    if (countdown.finished) {
      debugPrint('countdonw.finished');
      // Prefer the timer callback, but this is better in some cases
    }
// *********
    if (checkInterval('check win', 100, dt)) {
      _checkWin();
    }
    super.update(dt);
  }

  void _checkWin() {
    var containGem = gameRef.query<Blocks>().isNotEmpty;
    if (!containGem && !showWin) {
      showWin = true;
      gameRef.pauseEngine;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Congratulation, you cleaned your home!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
