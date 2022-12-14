import 'package:flutter/material.dart';
import 'package:menu_app/app/features/home/view_model/home_notifier.dart';
import 'package:menu_app/app/features/login/view/login_screen.dart';
import 'package:menu_app/app/features/login/view_model/login_notifier.dart';
import 'package:menu_app/app/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (create) => HomeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (create) => LoginNotifier(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: AppRoutes.navigateKey,
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}
