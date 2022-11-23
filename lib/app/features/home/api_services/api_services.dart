import 'package:dio/dio.dart';
import 'package:menu_app/app/features/home/model/menu_response.dart';
import 'package:menu_app/app/styles/api_endpoints.dart';

class ApiServices {
  Future<MenuResponse> fetchMenu() async {
    try {
      Response response = await Dio().get(
        ApiEndpoints.baseUrl,
      );
      if (response.statusCode == 200) {
        return MenuResponse.fromJson(
          response.data,
          "Success",
          true,
        );
      } else {
        return MenuResponse(
          status: false,
          message: "Something wrong",
          menuModel: [],
        );
      }
    } on DioError catch (e) {
      return MenuResponse(
        status: false,
        message: e.message,
        menuModel: [],
      );
    } catch (e) {
      return MenuResponse(
        status: false,
        message: e.toString(),
        menuModel: [],
      );
    }
  }
}
