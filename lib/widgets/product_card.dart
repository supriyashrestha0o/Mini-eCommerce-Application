import 'package:flutter/material.dart';

import '../core/app_theme.dart';
import '../models/product.dart';
import 'network_image_box.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  // Called when the card or the "View Details" button is pressed.
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.grey.shade200,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Hero(
                        tag: 'product-image-${product.id}',
                        child: NetworkImageBox(url: product.image),
                      ),
                    ),
                    // Sale / New badge
                    if (product.discountPercent > 0)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: _Badge(
                          text: '-${product.discountPercent}%',
                          color: AppColors.sale,
                        ),
                      )
                    else if (product.isNew)
                      const Positioned(
                        top: 8,
                        left: 8,
                        child: _Badge(text: 'NEW', color: AppColors.primary),
                      ),
                    // Favorite icon
                    const Positioned(top: 2, right: 2, child: _FavoriteButton()),
                  ],
                ),
              ),
            ),

            //product info
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          formatPrice(product.price),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const Icon(Icons.star, size: 14, color: AppColors.star),
                      const SizedBox(width: 2),
                      Text(
                        product.rating.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 34,
                    child: ElevatedButton(
                      onPressed: onTap, // navigates to product details
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        'View Details',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color color;

  const _Badge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _FavoriteButton extends StatefulWidget {
  const _FavoriteButton();

  @override
  State<_FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<_FavoriteButton> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setState(() => _isFavorite = !_isFavorite),
      iconSize: 20,
      visualDensity: VisualDensity.compact,
      style: IconButton.styleFrom(backgroundColor: Colors.white70),
      icon: Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: _isFavorite ? AppColors.sale : Colors.black54,
      ),
    );
  }
}