import 'dart:async';

import 'package:flutter/material.dart';

import 'package:bonfire/bonfire.dart';

import 'package:cleaning_my_home/util/commom_sprite_sheet.dart';

class CrabPlayer extends SimplePlayer with BlockMovementCollision, Lighting {
  CrabPlayer({
    required super.position,
  }) : super(
          animation: CommomSpritesheet().simpleAnimation(),
          size: Vector2.all(32),
          speed: 40,
        ) {
    setupLighting(
      LightingConfig(
        radius: width * 1.5,
        color: Colors.transparent,
        withPulse: true,
        pulseVariation: 0.1,
        pulseSpeed: 0.05,
        blurBorder: 5.0,
      ),
    );
  }

  @override
  Future<void> onLoad() {
    add(CircleHitbox());
    return super.onLoad();
  }
}
