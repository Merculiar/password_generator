import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../common/constants.dart';

class PasswordBloc extends ChangeNotifier {
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

  void refreshValues() {
    password = '';
    number = 8;
    _isUpper = false;
    _isLower = false;
    _isNumber = false;
    isError = false;
    _isSymbol = false;
    notifyListeners();
  }

  void clearValues() {
    password = '';
    number = 8;
    _isUpper = false;
    _isLower = false;
    _isNumber = false;
    isError = false;
    _isSymbol = false;
  }

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
    if (isUpper) {
      _finalSet += Constants.uppercaseChars;
    }
    if (isLower) {
      _finalSet += Constants.lowercaseChars;
    }
    if (isNumber) {
      _finalSet += Constants.numbersChars;
    }
    if (isSymbol) {
      _finalSet += Constants.symbolsChars;
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
