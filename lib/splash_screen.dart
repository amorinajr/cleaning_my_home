import 'package:cleaning_my_home/menu.dart';

import 'package:flame_splash_screen/flame_splash_screen.dart';

import 'package:flutter/material.dart';

class SplashScreenGame extends StatefulWidget {
  const SplashScreenGame({super.key});

  @override
  State<SplashScreenGame> createState() => _SplashScreenGameState();
}

class _SplashScreenGameState extends State<SplashScreenGame> {
  late FlameSplashController controller;

  @override
  void initState() {
    super.initState();
    controller = FlameSplashController(
      fadeInDuration: const Duration(milliseconds: 50),
      fadeOutDuration: const Duration(milliseconds: 50),
      waitDuration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    controller.dispose(); // dispose it when necessary
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlameSplashScreen(
        showAfter: (BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SizedBox(
                width: 1280,
                height: 720,
                child: Center(
                  child: Image.asset(
                    'assets/images/title-background/splash-screen-children-block-aquarium.png',
                    scale: 0.5,
                  ),
                ),
              ),
            ),
          );
        },
        theme: FlameSplashTheme.dark,
        onFinish: (context) => Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute(builder: (context) => const Menu()),
        ),
      ),
    );
  }
}
