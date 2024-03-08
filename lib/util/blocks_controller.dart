import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class BlocksNumberController extends ChangeNotifier {
  static final BlocksNumberController _singleton =
      BlocksNumberController._internal();

  factory BlocksNumberController() {
    return _singleton;
  }
  BlocksNumberController._internal();

  int _blocksNumber = 0;
  int get blocksNumber => _blocksNumber;

  set blocksNumber(int newblocksNumber) {
    _blocksNumber = newblocksNumber;
    notifyListeners();
  }

  void configure({required int maxBlocks}) {
    _blocksNumber = maxBlocks;
    notifyListeners();
  }

  void updateBlocksNumber(int blocksNumber) {
    this.blocksNumber = blocksNumber;
    notifyListeners();
  }
}
