import 'package:flutter/material.dart';
import 'package:virtual_keypad/virtual_keypad.dart';
import 'package:login_stateful/src/main_app.dart';

void main() {
  initializeKeyboardLayouts();
  // Switch language
  KeyboardLayoutProvider.instance.setLanguage('ar'); // Arabic
  KeyboardLayoutProvider.instance.setLanguage('en'); // English

  runApp(const MainApp());
}
