import 'package:flutter/material.dart';
import 'package:menu_app/app/styles/app_images.dart';

import 'widgets/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          AppImages.kLogo,
          width: 30,
          height: 30,
        ),
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
