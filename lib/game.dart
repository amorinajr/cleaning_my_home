import 'package:flutter/material.dart';

import 'package:bonfire/bonfire.dart';

import 'package:cleaning_my_home/player/crab.dart';
import 'package:cleaning_my_home/util/game_controller.dart';
import 'package:cleaning_my_home/interface/hud_interface.dart';
import 'package:cleaning_my_home/decoration/blocks.dart';
import 'package:cleaning_my_home/decoration/recyclebin.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    const tileSize = 16.0;
    debugPrint('entrou aqui');
    return Material(
      color: Colors.transparent,
      child: BonfireWidget(
        keyboardConfig: KeyboardConfig(
          directionalKeys: KeyboardDirectionalKeys.arrows(),
        ),
        joystick: Joystick(
          directional: JoystickDirectional(),
        ),
        map: WorldMapByTiled(
          TiledReader.asset('tiled/aquario.tmj'),
          objectsBuilder: {
            'block': (properties) => Blocks(properties.position),
            'recyclebin': (properties) => RecycleBin(properties.position),
          },
        ),
        overlayBuilderMap: {
          'blockCounterInterface': (context, game) =>
              const BlocksCounterInterface(),
          'timerInterface': (context, game) => const TimerInterface(),
        },
        initialActiveOverlays: const [
          'blockCounterInterface',
          'timerInterface',
        ],
        player: CrabPlayer(
          position: Vector2(1008, 592),
        ),
        lightingColorGame: Colors.blue.withOpacity(0.08),
        cameraConfig: CameraConfig(
          zoom: getZoomFromMaxVisibleTile(context, tileSize * 2.2, 16),
          moveOnlyMapArea: true,
        ),
        debugMode: true,
        showCollisionArea: true,
        interface: Interface(),
        components: [GameController()],
      ),
    );
  }
}
