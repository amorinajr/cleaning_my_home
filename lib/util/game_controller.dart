import 'dart:async';

import 'package:cleaning_my_home/util/commom_sprite_sheet.dart';
import 'package:cleaning_my_home/util/custom_sprite_animation_widget.dart';
import 'package:cleaning_my_home/util/timer_controller.dart';
import 'package:cleaning_my_home/decoration/blocks.dart';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:bonfire/bonfire.dart';

class GameController extends GameComponent {
  bool finalTalk = false;
  bool showWin = true;
  bool showAllBlocksBin = true;

  late Timer countdown;
  late TimerController timerController;

  int remainingTime = 5;
  bool timerStarted = false;

  final VoidCallback reset;

  GameController({required this.reset});

  @override
  FutureOr<void> onLoad() {
    // **** incialização do timer ****

    timerController = TimerController();
    timerController.remainingTime = remainingTime;

    timerController.countDown = Timer(
      1,
      onTick: () {
        if (timerController.remainingTime > 0) {
          timerController.remainingTime -= 1;
        }
      },
      repeat: true,
    );

    // **** end fim incialização timer ****

    return super.onLoad();
  }

  @override
  void onMount() {
    TalkDialog.show(
      gameRef.context,
      [
        Say(
          text: [
            const TextSpan(
              text: 'We need to clean our home!',
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
        Say(
          text: [
            const TextSpan(
              text: 'You have a time left to find the blocks!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
              ),
            )
          ],
          person: CustomSpriteAnimationWidget(
            animation: TalkSpriteSheet.crabTalking(),
          ),
          personSayDirection: PersonSayDirection.LEFT,
        ),
      ],
      // onChangeTalk: (index) {
      //   Sounds.interaction();
      // },
      onFinish: () {
        finalTalk = true;
      },
      logicalKeyboardKeysToNext: [
        LogicalKeyboardKey.space,
      ],
    );
    super.onMount();
  }

// *********

  @override
  void update(double dt) {
// Código para controle do tempo

    if (timerController.remainingTime > 0) {
      if (finalTalk) {
        timerController.countDown.update(dt);
      }
    } else {
      finalTalk = false;
      timerController.remainingTime = 10000;

      TalkDialog.show(
        gameRef.context,
        [
          Say(
            text: [
              const TextSpan(
                text: 'Infelizmente você não conseguiu limpar a tempo!',
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
          Say(
            text: [
              const TextSpan(
                text: 'Vamos tentar de novo?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
            person: CustomSpriteAnimationWidget(
              animation: TalkSpriteSheet.crabTalking(),
            ),
            personSayDirection: PersonSayDirection.LEFT,
          ),
        ],
        // onChangeTalk: (index) {
        //   Sounds.interaction();
        // },
        onFinish: () {
          finalTalk = true;
          reset();
        },
        logicalKeyboardKeysToNext: [
          LogicalKeyboardKey.space,
        ],
      );
    }

// *********
    if (checkInterval('check win', 100, dt)) {
      _checkWin();
    }
    super.update(dt);
  }

  void _checkWin() {
    bool containBlocks = gameRef.query<Blocks>().isNotEmpty;

    if (!containBlocks && showWin) {
      finalTalk = false;

      gameRef.pauseEngine();

      TalkDialog.show(
        gameRef.context,
        [
          Say(
            text: [
              const TextSpan(
                text: 'Você pegou todos os blocos, vamos agora para o Bin!',
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
        // onChangeTalk: (index) {
        //   Sounds.interaction();
        // },
        onFinish: () {
          gameRef.resumeEngine();
          finalTalk = true;
          showWin = false;
        },
        logicalKeyboardKeysToNext: [
          LogicalKeyboardKey.space,
        ],
      );
    }
  }
}
