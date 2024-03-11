import 'package:bonfire/bonfire.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:cleaning_my_home/menu.dart';
import 'package:cleaning_my_home/splash_screen.dart';
import 'package:cleaning_my_home/util/sounds.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }

  await Sounds.initialize();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cleaning My House',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            width: 960,
            height: 540,
            child: SplashScreenGame(),
          ),
        ),
      ),
    ),
  );

  //   runApp(
  //   const MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Cleaning My House',
  //     home: Scaffold(
  //       backgroundColor: Colors.black,
  //       body: Center(
  //         child: SizedBox(
  //           width: 960,
  //           height: 540,
  //           child: Menu(),
  //         ),
  //       ),
  //     ),
  //   ),
  // );
}
