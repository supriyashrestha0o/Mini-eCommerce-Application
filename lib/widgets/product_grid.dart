import 'package:flutter/material.dart';

import '../models/product.dart';
import '../screens/product_details_page.dart';
import 'product_card.dart';


class ProductGrid extends StatelessWidget {
  final List<Product> products;

  final bool insideScrollView;

  const ProductGrid({
    super.key,
    required this.products,
    this.insideScrollView = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: insideScrollView,
      physics: insideScrollView ? const NeverScrollableScrollPhysics() : null,
      padding: const EdgeInsets.all(16),
      itemCount: products.length,

      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.62,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(product: product),
              ),
            );
          },
        );
      },
    );
  }
}