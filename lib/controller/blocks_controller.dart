import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class BlocksNumberController extends ChangeNotifier {
  static final BlocksNumberController _singleton =
      BlocksNumberController._internal();

  factory BlocksNumberController() {
    return _singleton;
  }
  BlocksNumberController._internal();

  int _blocksNumber = 5;
  int get blocksNumber => _blocksNumber;

  bool _blocksBin = false;
  bool get blocksBin => _blocksBin;

  set blocksNumber(int newblocksNumber) {
    _blocksNumber = newblocksNumber;
    notifyListeners();
  }

  set blocksBin(bool newblocksBin) {
    _blocksBin = newblocksBin;
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
