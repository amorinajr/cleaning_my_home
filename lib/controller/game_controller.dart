import 'dart:async';

import 'package:cleaning_my_home/controller/blocks_controller.dart';
import 'package:cleaning_my_home/game.dart';
import 'package:cleaning_my_home/util/commom_sprite_sheet.dart';
import 'package:cleaning_my_home/util/custom_sprite_animation_widget.dart';
import 'package:cleaning_my_home/util/dialogs.dart';
import 'package:cleaning_my_home/util/sounds.dart';
import 'package:cleaning_my_home/controller/timer_controller.dart';
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

  late BlocksNumberController blockControler;

  int remainingTime = 60;
  bool timerStarted = false;

  bool firstTimeStarting = true;

  final VoidCallback reset;

  GameController({required this.reset});

  @override
  FutureOr<void> onLoad() {
    // **** incialização do timer ****

    timerController = TimerController();
    timerController.remainingTime = remainingTime;

    return super.onLoad();
  }

  @override
  void onMount() {
    // debugPrint('iniciando o onMount');

    timerController = TimerController();
    timerController.remainingTime = remainingTime;

    if (firstTimeStarting) {
      // debugPrint('iniciando o Countdown');
      timerController.countDown = Timer(
        1,
        onTick: () {
          if (timerController.remainingTime > 0) {
            timerController.remainingTime -= 1;
          }
        },
        repeat: true,
      );
      firstTimeStarting = false;
    }
// tava no onLoad

    Sounds.playBackgroundSound();

    blockControler = BlocksNumberController();
    blockControler.blocksBin = false;

    Sounds.talking();

    TalkDialog.show(
      gameRef.context,
      [
        Say(
          text: [
            const TextSpan(
              text:
                  'We need to find all the plastic building blocks for cleaning our home!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Crayon',
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
              text:
                  'There is a time limit to save our home, but I believe that for each step, we will have a reward.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Crayon',
              ),
            )
          ],
          person: CustomSpriteAnimationWidget(
            animation: TalkSpriteSheet.crabTalking(),
          ),
          personSayDirection: PersonSayDirection.LEFT,
        ),
      ],
      onChangeTalk: (index) {
        Sounds.talking();
      },
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

    blockControler = BlocksNumberController();
    if (blockControler.blocksBin && finalTalk) {
      // debugPrint('entrou aqui');
      finalTalk = false;
      timerController.remainingTime = 10000;
      blockControler.blocksBin = false;
      (gameRef.player as Player).stopMove();

      GameOver.showGameOver(
        context,
        () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Game(
                mapEscolhido: 2,
              ),
            ),
          );
        },
      );
    }

    if (timerController.remainingTime > 0) {
      if (finalTalk) {
        timerController.countDown.update(dt);
      }
    } else {
      finalTalk = false;
      timerController.remainingTime = 10000;

      // debugPrint('entrou no final');

      gameRef.pauseEngine();

      Sounds.talking();
      TalkDialog.show(
        gameRef.context,
        [
          Say(
            text: [
              const TextSpan(
                text:
                    'Unfortunately you couldn\'t find all the blocks in time!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Crayon',
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
                text: 'However, don\'t give up! Let\'s try again?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Crayon',
                ),
              ),
            ],
            person: CustomSpriteAnimationWidget(
              animation: TalkSpriteSheet.crabTalking(),
            ),
            personSayDirection: PersonSayDirection.LEFT,
          ),
        ],
        onChangeTalk: (index) {
          Sounds.talking();
        },
        onFinish: () {
          gameRef.resumeEngine();
          Sounds.resumeBackgroundSound();
          finalTalk = true;
          reset();
        },
        logicalKeyboardKeysToNext: [
          LogicalKeyboardKey.space,
        ],
      );

// fim dialog
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
      Sounds.talking();

      TalkDialog.show(
        gameRef.context,
        [
          Say(
            text: [
              const TextSpan(
                text: 'You found and collected all the plastic blocks!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Crayon',
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
                text: 'We need to take them to the Recycling Bin now.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Crayon',
                ),
              ),
            ],
            person: CustomSpriteAnimationWidget(
              animation: TalkSpriteSheet.crabTalking(),
            ),
            personSayDirection: PersonSayDirection.LEFT,
          ),
        ],
        onChangeTalk: (index) {
          Sounds.talking();
        },
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
