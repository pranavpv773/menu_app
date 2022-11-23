import 'package:menu_app/app/features/home/model/menu_model.dart';

class MenuResponse {
  bool status;
  String message;
  List<MenuModel> menuModel;
  MenuResponse(
      {required this.status, required this.message, required this.menuModel});
  factory MenuResponse.fromJson(
          List<dynamic> json, String message, bool status) =>
      MenuResponse(
        status: status,
        message: message,
        menuModel:
            json == [] ? [] : json.map((e) => MenuModel.fromJson(e)).toList(),
      );
}
