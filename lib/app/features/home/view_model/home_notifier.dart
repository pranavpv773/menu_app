// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:menu_app/app/features/home/api_services/api_services.dart';
import 'package:menu_app/app/features/home/model/menu_response.dart';

class HomeNotifier with ChangeNotifier {
  List menuModelList = [];
  fetchMenuApi(BuildContext context) async {
    MenuResponse resp = await ApiServices().fetchMenu();
    if (resp.status == true) {
      menuModelList.clear();
      menuModelList.addAll(
        resp.menuModel,
      );
      log(menuModelList.toString());
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
