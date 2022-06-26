import 'package:flutter/material.dart';

class InputProvider extends ChangeNotifier {
  String? _userInput = '';
  String _spacelessName = '';
  List<int> _randomNumberList = [];
  List<String> _coloredNumberList = [];

  final TextEditingController nameController = TextEditingController();

  String? get userInput => _userInput;

  set userInput(String? value) {
    _userInput = value;
    notifyListeners();
  }

  int? get nameLength => _userInput?.length;

  String get spacelessName => _spacelessName;

  set spacelessName(String value) {
    _spacelessName = value;
    notifyListeners();
  }

  List<int> get randomNumberList => _randomNumberList;

  set randomNumberList(List<int> value) {
    _randomNumberList = value;
    notifyListeners();
  }

  List<String> get coloredNumberList => _coloredNumberList;

  set coloredNumberList(List<String> value) {
    _coloredNumberList = value;
    notifyListeners();
  }
}
