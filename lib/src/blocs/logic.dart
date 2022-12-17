import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../common/constants.dart' as constants;

class LogicBloc extends ChangeNotifier {
  String password = '';

  int number = 8;

  bool _isUpper = false;
  bool get isUpper => _isUpper;
  set setUpper(bool val) => _isUpper = val;

  bool _isLower = false;
  bool get isLower => _isLower;
  set setLower(bool val) => _isLower = val;

  bool isError = false;
  bool _isNumber = false;
  bool get isNumber => _isNumber;
  set setNumber(bool val) => _isNumber = val;

  bool _isSymbol = false;
  bool get isSymbol => _isSymbol;
  set setSymbol(bool val) => _isSymbol = val;

  bool setOption(String text, bool val) {
    if (text == 'isUpper') {
      setUpper = val;
    }
    if (text == 'isLower') {
      setLower = val;
    }
    if (text == 'isNumber') {
      setNumber = val;
    }
    if (text == 'isSymbol') {
      setSymbol = val;
    }
    return false;
  }

  bool getOption(String text) {
    if (text == 'isUpper') {
      return isUpper;
    }
    if (text == 'isLower') {
      return isLower;
    }
    if (text == 'isNumber') {
      return isNumber;
    }
    if (text == 'isSymbol') {
      return isSymbol;
    }
    return false;
  }

  void generatePassword() {
    String _finalSet = '';
    isError = false;
    if (isUpper == true) {
      _finalSet += constants.UPPERCASE_CHARS;
    }
    if (isLower == true) {
      _finalSet += constants.LOWERCASE_CHARS;
    }
    if (isNumber == true) {
      _finalSet += constants.NUMBERS_CHARS;
    }
    if (isSymbol == true) {
      _finalSet += constants.SYMBOLS_CHARS;
    }
    if (_finalSet.isEmpty) {
      _finalSet = 'Please, choose at least one checkbox!';
      isError = true;
      password = _finalSet;
      notifyListeners();
      return;
    }
    var random = Random.secure();
    String newPass = List.generate(
        number, (index) => _finalSet[random.nextInt(_finalSet.length)]).join();
    password = newPass;
    notifyListeners();
  }
}
