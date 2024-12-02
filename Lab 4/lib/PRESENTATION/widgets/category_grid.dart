// PRESENTATION/widgets/category_grid.dart
import 'package:flutter/material.dart';
import '../../DOMAIN/models/category.dart';

class CategoryGrid extends StatelessWidget {
  final List<Category> categories;

  CategoryGrid({required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Column(
          children: [
            Icon(Icons.category),
            Text(category.title),
          ],
        );
      },
    );
  }
}
