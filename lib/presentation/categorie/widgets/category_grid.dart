import 'package:clean_architecture_2/domain/entities/categories.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture_2/presentation/categorie/viewmodel/categories_state.dart';

import 'categories_section.dart';

class CategoryGrid extends StatelessWidget {
  final List<Categories> categories;
  final Function(Categories) onTap;
  const CategoryGrid({
    Key? key,
    required this.categories,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) => CategoriesSection(
              categories: categories[index],
              onTap: () {
                onTap(
                  categories[index],
                );
              })),
    );
  }
}
