import 'package:flame_audio/flame_audio.dart';

class Sounds {
  static Future initialize() async {
    FlameAudio.bgm.initialize();
    await FlameAudio.audioCache.loadAll([
      'block-pop.mp3',
      'block-recyclebin-pop.mp3',
      'talking.mp3',
      'soundtrack.mp3',
    ]);
  }

  static void blockPop() {
    FlameAudio.play('block-pop.mp3', volume: 1);
  }

  static void blockRecycleBinPop() {
    FlameAudio.play('block-recyclebin-pop.mp3', volume: 0.5);
  }

  static void talking() {
    FlameAudio.play('talking.mp3', volume: 0.5);
  }

  static stopBackgroundSound() {
    return FlameAudio.bgm.stop();
  }

  static void playBackgroundSound() async {
    await FlameAudio.bgm.stop();
    FlameAudio.bgm.play('soundtrack.mp3', volume: 0.5);
  }

  static void pauseBackgroundSound() {
    FlameAudio.bgm.pause();
  }

  static void resumeBackgroundSound() {
    FlameAudio.bgm.resume();
  }

  static void dispose() {
    FlameAudio.bgm.dispose();
  }
}
