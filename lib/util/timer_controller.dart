import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class TimerController extends ChangeNotifier {
  static final TimerController _singleton = TimerController._internal();

  factory TimerController() {
    return _singleton;
  }
  TimerController._internal();

  late Timer _countdown;
  Timer get countDown => _countdown;

  set countDown(Timer newCountdown) {
    _countdown = newCountdown;
    notifyListeners();
  }

  void configure({required Timer maxCountDown}) {
    _countdown = maxCountDown;
    notifyListeners();
  }

  void updateBlocksNumber(Timer countDown) {
    this.countDown = countDown;
    notifyListeners();
  }

//  remaining Time
  late int _remainingTime;
  int get remainingTime => _remainingTime;

  set remainingTime(int newRemainingTime) {
    _remainingTime = newRemainingTime;
    notifyListeners();
  }

  void configureRemaingTime({required int maxRemainingTime}) {
    _remainingTime = maxRemainingTime;
    notifyListeners();
  }

  void updateRemaingTime(int remainingTime) {
    this.remainingTime = remainingTime;
    notifyListeners();
  }
}
