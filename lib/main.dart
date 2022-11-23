import 'package:flutter/material.dart';
import 'package:menu_app/app/features/login/view/login_screen.dart';
import 'package:menu_app/app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRoutes.navigateKey,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
