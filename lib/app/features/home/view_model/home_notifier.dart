// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:menu_app/app/features/home/api_services/api_services.dart';
import 'package:menu_app/app/features/home/model/menu_model.dart';
import 'package:menu_app/app/features/home/model/menu_response.dart';

class HomeNotifier with ChangeNotifier {
  List<MenuModel> menuModelList = [];
  final int count = 0;
  fetchMenuApi(BuildContext context) async {
    MenuResponse resp = await ApiServices().fetchMenu();
    if (resp.status == true) {
      menuModelList.clear();
      menuModelList.addAll(
        resp.menuModel.toList(),
      );
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            resp.message,
          ),
        ),
      );
    }
  }
}
