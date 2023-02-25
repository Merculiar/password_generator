import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SaveDataService {
  Future<void> savePassword(String name, String value) async {
    final prefs = await SharedPreferences.getInstance();
    final password = {name: value};
    String encodedMap = json.encode(password);
    final List<String> passwords = prefs.getStringList('passwords') ?? [];
    passwords.add(encodedMap);
    await prefs.setStringList('passwords', passwords);
  }

  Future<List<Map<String, dynamic>>> fetchPasswords() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? encodedPasswords = prefs.getStringList('passwords');
    List<Map<String, dynamic>> passwords = [];
    encodedPasswords?.forEach((element) {
      Map<String, dynamic> decodedPassword = json.decode(element);
      passwords.add(decodedPassword);
    });
    return passwords;
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
