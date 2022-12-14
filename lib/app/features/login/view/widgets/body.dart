import 'package:flutter/material.dart';
import 'package:menu_app/app/features/login/view_model/login_notifier.dart';
import 'package:menu_app/app/styles/app_colors.dart';
import 'package:menu_app/app/styles/app_images.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.primary,
      child: Center(
        child: GestureDetector(
          onTap: () {
            context.read<LoginNotifier>().googleLog(context);
          },
          child: Image.asset(
            AppImages.kGoogle,
            width: 100,
          ),
        ),
      ),
    );
  }
}
