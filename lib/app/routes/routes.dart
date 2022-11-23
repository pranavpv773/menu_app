import 'package:flutter/material.dart';

class AppRoutes {
  static final navigateKey = GlobalKey<NavigatorState>();
  static nxtScreen(var screen) {
    navigateKey.currentState!.push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}
