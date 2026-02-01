import 'package:flutter/material.dart';

class CategoryModels {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModels({
    required this.name,
    // ignore: non_constant_identifier_names
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModels> getCategories() {
    List<CategoryModels> categories = [];

    categories.add(
      CategoryModels(
        name: 'Salad',
        iconPath: 'assets/Icons/plate.svg',
        boxColor: Colors.pink,
      ),
    );

    categories.add(
      CategoryModels(
        name: 'Cake',
        iconPath: 'assets/Icons/pancakes.svg',
        boxColor: const Color.fromARGB(255, 176, 30, 233),
      ),
    );

    categories.add(
      CategoryModels(
        name: 'Pie',
        iconPath: 'assets/Icons/pie.svg',
        boxColor: Colors.pink,
      ),
    );

    categories.add(
      CategoryModels(
        name: 'Smoothies',
        iconPath: 'assets/Icons/orange-snacks.svg',
        boxColor: const Color.fromARGB(255, 176, 30, 233),
      ),
    );

    return categories;
  }
}
