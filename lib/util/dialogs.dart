import 'package:cleaning_my_home/util/commom_sprite_sheet.dart';
import 'package:cleaning_my_home/util/custom_sprite_animation_widget.dart';

import 'package:flutter/material.dart';

class GameOver {
  static showGameOver(BuildContext context, VoidCallback playAgain) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 100,
                width: 100,
                child: CustomSpriteAnimationWidget(
                  animation: TalkSpriteSheet.crabTalking(),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Image.asset('assets/images/play-again.png'),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[200]),
                ),
                onPressed: playAgain,
                child: const Text(
                  'Let\'s play again?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Crayon',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
