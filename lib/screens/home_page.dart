import 'package:flutter/material.dart';

import '../core/app_theme.dart';
import '../data/product_data.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/category_item.dart';
import '../widgets/product_grid.dart';
import '../widgets/section_header.dart';
import 'category_page.dart';

// Screen 1 - Home page.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openCategory(BuildContext context, String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(categoryName: categoryName),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.shopping_bag, color: AppColors.primary),
            SizedBox(width: 8),
            Text(
              'MyShop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showMessage(context, 'Search is not available yet'),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => _showMessage(context, 'Your cart is empty'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.m),

            // Carousel / banners
            BannerCarousel(
              items: banners,
              onBannerTap: (banner) =>
                  _openCategory(context, banner.targetCategory),
            ),

            // Horizontal category list
            const SectionHeader(title: 'Categories'),
            const SizedBox(height: AppSpacing.s),
            SizedBox(
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
                child: Row(
                  children: [
                    for (final category in categories) ...[
                      CategoryItem(
                        category: category,
                        onTap: () => _openCategory(context, category.name),
                      ),
                      const SizedBox(width: AppSpacing.s),
                    ],
                  ],
                ),
              ),
            ),

            // Popular products
            SectionHeader(
              title: 'Popular Products',
              onSeeAll: () => _openCategory(context, 'All'),
            ),
            ProductGrid(
              products: products.take(6).toList(),
              insideScrollView: true,
            ),
          ],
        ),
      ),
    );
  }
}