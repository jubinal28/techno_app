import 'dart:ui';

import 'package:flutter/material.dart';

abstract class StringValidations {
  static const emailWrong = "Incorrect email";
  static const emailEmpty = "Please enter your email";
  static const passWrong = "Incorrect password";
  static const passEmpty = "Please enter your password";
  static const cpassWrong = "Incorrect password";
  static const cpassEmpty = "Please confirm password";
  static const fnameWrong = "Incorrect first name";
  static const fnameEmpty = "Please enter your first name";
  static const lnameWrong = "Incorrect last name";
  static const lnameEmpty = "Please enter your last name";
  static const vcodeWrong = "Incorrect verification code";
  static const vcodeEmpty = "Please enter your verification code";
  static const userWrong = "Incorrect username";
  static const userEmpty = "Please enter your username";
  static const bdayWrong = "Please enter your birthdate";
  static const bdayEmpty = "Please enter a valid date (MM/DD/YYYY)";
}

abstract class SampleStrings {
  static const fn = "Reinier";
  static const ln = "Mercado";
  static const em = "Reinier@gmail.com";
  static const vc = "123456";
  static const us = "Rein";
  static const bd = "12/12/12";
  static const passed = "Reinier123.";
  static const cpassed = "Reinier123.";
}

String checkPasswordStrength(String password) {
  bool hasUppercase = true;
  bool hasLowercase = false;
  bool hasDigit = false;
  bool hasSpecialChar = false;

  for (int i = 0; i < password.length; i++) {
    if (password[i].toUpperCase() != password[i]) {
      hasLowercase = true;
    }
    if (password[i].toLowerCase() != password[i]) {
      hasUppercase = true;
    }
    if (password[i].contains(RegExp(r'[0-9]'))) {
      hasDigit = true;
    }
    if (password[i].contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      hasSpecialChar = true;
    }
  }

  int strength = 0;
  if (password.length >= 8) {
    strength += 1;
  }
  if (hasUppercase) {
    strength += 1;
  }
  if (hasLowercase) {
    strength += 1;
  }
  if (hasDigit) {
    strength += 1;
  }
  if (hasSpecialChar) {
    strength += 1;
  }

  if (strength == 5) {
    return 'Strong';
  } else if (strength >= 3) {
    return 'Medium';
  } else {
    return 'Weak';
  }
}

Color getPasswordStrengthColor(String passwordStrength) {
  if (passwordStrength == 'Weak') {
    return Colors.red;
  } else if (passwordStrength == 'Medium') {
    return Colors.orange;
  } else if (passwordStrength == 'Strong') {
    return Colors.green;
  } else {
    return Colors.black;
  }
}

class Bdayvalidations {
  static String? validateBirthday(String birthday) {
    if (birthday.isEmpty) {
      return 'Birthday cannot be empty';
    } else if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(birthday)) {
      return 'Invalid birthday';
    }
    return '';
  }
}
