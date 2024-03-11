import 'package:cleaning_my_home/credits.dart';
import 'package:cleaning_my_home/game.dart';
import 'package:cleaning_my_home/util/commom_sprite_sheet.dart';
import 'package:cleaning_my_home/util/custom_sprite_animation_widget.dart';
import 'package:cleaning_my_home/util/sounds.dart';

import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void dispose() {
    Sounds.stopBackgroundSound();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: buildMenu(),
    );
  }

  Widget buildMenu() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: 960,
          height: 540,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Container(
              width: 960,
              height: 540,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/title-background/background-title.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const SizedBox(
                        width: 100.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 75.0,
                          ),
                          SizedBox(
                            height: 200,
                            width: 200,
                            child: CustomSpriteAnimationWidget(
                              animation: TalkSpriteSheet.crabTalking(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 75.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 75.0,
                          ),
                          SizedBox(
                            width: 250,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                minimumSize: const Size(100, 40), //////// HERE
                              ),
                              child: const Text(
                                'Play',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Game(
                                      mapEscolhido: 1,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 250,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                minimumSize: const Size(100, 40), //////// HERE
                              ),
                              child: const Text(
                                'Creditos',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Credits(),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const SizedBox(
                            width: 150.0,
                            child: Text(
                              '#GlobalGamersChallenge ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 100.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
