import 'package:flutter/material.dart';

class InputChipsController extends ChangeNotifier {
  final List<String> _chips = [];

  List<String> get chips => _chips;

  void addChip(String chip) {
    _chips.add(chip);
    notifyListeners();
  }

  void removeChip(String chip) {
    _chips.remove(chip);
    notifyListeners();
  }

  // add all
  void addAllChips(List<String> chips) {
    _chips.addAll(chips);
    notifyListeners();
  }
}
