import 'dart:ffi';

import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    int porcentaje = 100;
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
      name: 'Salad',
      iconPath: 'assets/icons/plate.svg',
      boxColor: Color.fromARGB(porcentaje, 180, 241, 185),
    ));
    categories.add(CategoryModel(
      name: 'Pie',
      iconPath: 'assets/icons/pie.svg',
      boxColor: Color.fromARGB(porcentaje, 227, 241, 185),
    ));
    categories.add(CategoryModel(
      name: 'Cake',
      iconPath: 'assets/icons/blueberry-pancake.svg',
      boxColor: Color.fromARGB(porcentaje, 229, 144, 222),
    ));
    categories.add(CategoryModel(
      name: 'Orange',
      iconPath: 'assets/icons/orange-snacks.svg',
      boxColor: Color.fromARGB(porcentaje, 231, 182, 83),
    ));
    return categories;
  }
}
