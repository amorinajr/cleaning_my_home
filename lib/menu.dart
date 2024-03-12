import 'package:cleaning_my_home/credits.dart';
import 'package:cleaning_my_home/game.dart';
import 'package:cleaning_my_home/how_to_play.dart';
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
          width: 1200,
          height: 720,
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Container(
              // width: 960,
              // height: 540,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/title-background/background-title.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const SizedBox(
                        width: 50.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 75.0,
                          ),
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: CustomSpriteAnimationWidget(
                              animation: TalkSpriteSheet.crabTalking(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 50.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            height: 75.0,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 250,
                              maxHeight: 50,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  minimumSize: const Size(100, 40),
                                ),
                                child: const Text(
                                  'Play',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: 'Crayon',
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
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 250,
                              maxHeight: 50,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  minimumSize: const Size(100, 40),
                                ),
                                child: const Text(
                                  'How To Play',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: 'Crayon',
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HowToPlay(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 250,
                              maxHeight: 50,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  minimumSize: const Size(100, 40),
                                ),
                                child: const Text(
                                  'Credits',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: 'Crayon',
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
                          ),
                        ],
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
