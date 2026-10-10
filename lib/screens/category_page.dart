import 'package:flutter/material.dart';

import '../core/app_theme.dart';
import '../data/product_data.dart';
import '../widgets/product_grid.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;

  const CategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final categoryProducts = productsByCategory(categoryName);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName == 'All' ? 'All Products' : categoryName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: categoryProducts.isEmpty
          ? const Center(child: Text('No products found in this category'))
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppSpacing.m, AppSpacing.m, AppSpacing.m, 0),
            child: Text(
              '${categoryProducts.length} products',
              style: const TextStyle(color: AppColors.textSecondary),
            ),
          ),
          Expanded(child: ProductGrid(products: categoryProducts)),
        ],
      ),
    );
  }
}