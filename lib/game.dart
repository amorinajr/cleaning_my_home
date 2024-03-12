import 'package:flutter/material.dart';

import 'package:bonfire/bonfire.dart';

import 'package:cleaning_my_home/player/crab.dart';
import 'package:cleaning_my_home/controller/game_controller.dart';
import 'package:cleaning_my_home/util/sounds.dart';
import 'package:cleaning_my_home/interface/hud_interface.dart';
import 'package:cleaning_my_home/decoration/blocks.dart';
import 'package:cleaning_my_home/decoration/recyclebin.dart';

class Game extends StatefulWidget {
  static int map = 1;
  final int mapEscolhido;
  const Game({super.key, required this.mapEscolhido});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  Key _gameKey = GlobalKey();
  late int mapEscolhido;

  @override
  void initState() {
    mapEscolhido = widget.mapEscolhido;

    super.initState();
  }

  @override
  void dispose() {
    Sounds.stopBackgroundSound();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const tileSize = 16.0;
    return Material(
      color: Colors.black,
      child: Center(
        child: SizedBox(
          width: 1280,
          height: 720,
          child: BonfireWidget(
            key: _gameKey,
            keyboardConfig: KeyboardConfig(
              directionalKeys: KeyboardDirectionalKeys.arrows(),
            ),
            joystick: Joystick(
              directional: JoystickDirectional(),
            ),
            map: WorldMapByTiled(
              TiledReader.asset('tiled/aquario-$mapEscolhido.tmj'),
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
              zoom: getZoomFromMaxVisibleTile(context, tileSize * 1.2, 20),
              moveOnlyMapArea: true,
            ),
            // debugMode: true,
            // showCollisionArea: true,
            interface: Interface(),
            components: [GameController(reset: reset)],
          ),
        ),
      ),
    );
  }

  void reset() {
    setState(() {
      _gameKey = UniqueKey();
    });
  }
}
