import 'package:bonfire/bonfire.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:cleaning_my_home/menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Menu(),
    ),
  );
}
