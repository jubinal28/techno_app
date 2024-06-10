import 'package:flutter/material.dart';

class SharedState {
  static final ValueNotifier<bool> isButtonPressedNotifier =
      ValueNotifier(false);
}
