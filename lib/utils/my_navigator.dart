import 'package:flutter/material.dart';

class MyNavigator {

  static void splashGoToLoginPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/login");
  }

  static void goToChatPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/chat");
  }
}
