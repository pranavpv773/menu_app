// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

List<MenuModel> menuModelFromJson(String str) =>
    List<MenuModel>.from(json.decode(str).map((x) => MenuModel.fromJson(x)));

String menuModelToJson(List<MenuModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuModel {
  MenuModel({
    this.restaurantId,
    required this.restaurantName,
    required this.restaurantImage,
    required this.tableId,
    required this.tableName,
    required this.branchName,
    required this.nexturl,
    required this.tableMenuList,
  });

  String? restaurantId;
  String restaurantName;
  String restaurantImage;
  String tableId;
  String tableName;
  String branchName;
  String nexturl;
  List<TableMenuList> tableMenuList;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        restaurantId: json["restaurant_id"],
        restaurantName: json["restaurant_name"],
        restaurantImage: json["restaurant_image"],
        tableId: json["table_id"],
        tableName: json["table_name"],
        branchName: json["branch_name"],
        nexturl: json["nexturl"],
        tableMenuList: List<TableMenuList>.from(
            json["table_menu_list"].map((x) => TableMenuList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurant_id": restaurantId,
        "restaurant_name": restaurantName,
        "restaurant_image": restaurantImage,
        "table_id": tableId,
        "table_name": tableName,
        "branch_name": branchName,
        "nexturl": nexturl,
        "table_menu_list":
            List<dynamic>.from(tableMenuList.map((x) => x.toJson())),
      };
}

class TableMenuList {
  TableMenuList({
    required this.menuCategory,
    required this.menuCategoryId,
    required this.menuCategoryImage,
    required this.nexturl,
    required this.categoryDishes,
  });

  String menuCategory;
  String menuCategoryId;
  String menuCategoryImage;
  String nexturl;
  List<CategoryDish> categoryDishes;

  factory TableMenuList.fromJson(Map<String, dynamic> json) => TableMenuList(
        menuCategory: json["menu_category"],
        menuCategoryId: json["menu_category_id"],
        menuCategoryImage: json["menu_category_image"],
        nexturl: json["nexturl"],
        categoryDishes: List<CategoryDish>.from(
            json["category_dishes"].map((x) => CategoryDish.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "menu_category": menuCategory,
        "menu_category_id": menuCategoryId,
        "menu_category_image": menuCategoryImage,
        "nexturl": nexturl,
        "category_dishes":
            List<dynamic>.from(categoryDishes.map((x) => x.toJson())),
      };
}

class AddonCat {
  AddonCat({
    required this.addonCategory,
    required this.addonCategoryId,
    required this.addonSelection,
    required this.nexturl,
    required this.addons,
  });

  String addonCategory;
  String addonCategoryId;
  int addonSelection;
  String nexturl;
  List<CategoryDish> addons;

  factory AddonCat.fromJson(Map<String, dynamic> json) => AddonCat(
        addonCategory: json["addon_category"],
        addonCategoryId: json["addon_category_id"],
        addonSelection: json["addon_selection"],
        nexturl: json["nexturl"],
        addons: List<CategoryDish>.from(
            json["addons"].map((x) => CategoryDish.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "addon_category": addonCategory,
        "addon_category_id": addonCategoryId,
        "addon_selection": addonSelection,
        "nexturl": nexturl,
        "addons": List<dynamic>.from(addons.map((x) => x.toJson())),
      };
}

class CategoryDish {
  CategoryDish({
    this.dishId,
    this.dishName,
    this.dishPrice,
    this.dishImage,
    this.dishCalories,
    this.dishDescription,
    this.dishAvailability,
    this.dishType,
    this.nexturl,
    this.addonCat,
  });

  String? dishId;
  String? dishName;
  double? dishPrice;
  String? dishImage;
  double? dishCalories;
  String? dishDescription;
  bool? dishAvailability;
  int? dishType;
  String? nexturl;
  List<AddonCat>? addonCat;

  factory CategoryDish.fromJson(Map<String, dynamic> json) => CategoryDish(
        dishId: json["dish_id"],
        dishName: json["dish_name"],
        dishPrice: json["dish_price"].toDouble(),
        dishImage: json["dish_image"],
        dishCalories: json["dish_calories"],
        dishDescription: json["dish_description"],
        dishAvailability: json["dish_Availability"],
        dishType: json["dish_Type"],
        nexturl: json["nexturl"],
        addonCat: json["addonCat"] == null
            ? null
            : List<AddonCat>.from(
                json["addonCat"].map((x) => AddonCat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dish_id": dishId,
        "dish_name": dishName,
        "dish_price": dishPrice,
        "dish_image": dishImage,
        "dish_calories": dishCalories,
        "dish_description": dishDescription,
        "dish_Availability": dishAvailability,
        "dish_Type": dishType,
        "nexturl": nexturl,
        "addonCat": addonCat == null
            ? null
            : List<dynamic>.from(addonCat!.map((x) => x.toJson())),
      };
}
