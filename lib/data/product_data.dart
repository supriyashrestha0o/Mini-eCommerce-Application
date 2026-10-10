import 'package:flutter/material.dart';

import '../models/banner_item.dart';
import '../models/category.dart';
import '../models/product.dart';

// All images are stored locally in assets/images/
String _img(String fileName) => 'assets/images/$fileName';

const List<Category> categories = [
  Category(name: 'Electronics', icon: Icons.devices, color: Color(0xFF5B3FD9)),
  Category(name: 'Fashion', icon: Icons.checkroom, color: Color(0xFFE91E63)),
  Category(name: 'Shoes', icon: Icons.directions_walk, color: Color(0xFFFF7043)),
  Category(
      name: 'Beauty',
      icon: Icons.face_retouching_natural,
      color: Color(0xFFAB47BC)),
  Category(name: 'Accessories', icon: Icons.watch, color: Color(0xFF00897B)),
  Category(name: 'Home', icon: Icons.chair_alt, color: Color(0xFF3949AB)),
];

const List<BannerItem> banners = [
  BannerItem(
    title: 'Summer Sale',
    subtitle: 'Up to 50% off on fashion',
    image: 'assets/images/banner_summer_sale.jpg',
    targetCategory: 'Fashion',
  ),
  BannerItem(
    title: 'New Arrivals',
    subtitle: 'Fresh picks for your home',
    image: 'assets/images/banner_new_arrivals.jpg',
    targetCategory: 'Home',
  ),
  BannerItem(
    title: 'Electronics Discount',
    subtitle: 'Best deals on gadgets',
    image: 'assets/images/banner_electronics.jpg',
    targetCategory: 'Electronics',
  ),
];

final List<Product> products = [
  Product(
    id: 1,
    name: 'Smartphone X Pro',
    category: 'Electronics',
    image: _img('smartphone.png'),
    price: 89999,
    rating: 4.7,
    description:
    'A flagship smartphone with a bright OLED display, a powerful processor and a pro-grade triple camera system.',
    isNew: true,
  ),
  Product(
    id: 2,
    name: 'Ultrabook Laptop',
    category: 'Electronics',
    image: _img('laptop.webp'),
    price: 74999,
    rating: 4.5,
    description:
    'Thin and light laptop with a 14-inch display, 16 GB RAM, fast SSD storage and all-day battery life.',
    discountPercent: 10,
  ),
  Product(
    id: 3,
    name: 'Wireless Headphones',
    category: 'Electronics',
    image: _img('headphones.png'),
    price: 3500,
    rating: 4.5,
    description:
    'Wireless headphones with high-quality sound and noise reduction.',
    discountPercent: 20,
  ),

  Product(
    id: 4,
    name: 'Classic T-Shirt',
    category: 'Fashion',
    image: _img('tshirt.jpg'),
    price: 899,
    rating: 4.2,
    description:
    'Soft 100% cotton t-shirt with a relaxed fit. Perfect for everyday wear.',
    isNew: true,
  ),
  Product(
    id: 5,
    name: 'Denim Jacket',
    category: 'Fashion',
    image: _img('denim__jacket.jpg'),
    price: 3200,
    rating: 4.4,
    description:
    'A timeless denim jacket with a durable finish that goes with almost any outfit.',
    discountPercent: 15,
  ),

  Product(
    id: 6,
    name: 'Urban Sneakers',
    category: 'Shoes',
    image: _img('sneakers.jpg'),
    price: 4500,
    rating: 4.6,
    description:
    'Comfortable everyday sneakers with a cushioned sole and breathable upper.',
    isNew: true,
  ),
  Product(
    id: 7,
    name: 'Running Shoes',
    category: 'Shoes',
    image: _img('running_shoes.jpg'),
    price: 5200,
    rating: 4.3,
    description:
    'Lightweight running shoes with extra grip and shock absorption for long distances.',
    discountPercent: 25,
  ),

  Product(
    id: 8,
    name: 'Matte Lipstick',
    category: 'Beauty',
    image: _img('lipstick.jpg'),
    price: 750,
    rating: 4.1,
    description: 'Long-lasting matte lipstick available in rich, bold shades.',
  ),
  Product(
    id: 9,
    name: 'Hydrating Face Cream',
    category: 'Beauty',
    image: _img('face_cream.jpg'),
    price: 1250,
    rating: 4.6,
    description:
    'Daily moisturising face cream that keeps your skin soft and hydrated for 24 hours.',
    isNew: true,
  ),

  Product(
    id: 10,
    name: 'Smart Watch',
    category: 'Accessories',
    image: _img('smartwatch.jpg'),
    price: 8999,
    rating: 4.4,
    description:
    'Track your steps, heart rate and sleep, and get phone notifications right on your wrist.',
    discountPercent: 12,
  ),
  Product(
    id: 11,
    name: 'Travel Backpack',
    category: 'Accessories',
    image: _img('backpack.jpg'),
    price: 2400,
    rating: 4.5,
    description:
    'Water-resistant backpack with a padded laptop compartment and multiple pockets.',
  ),
  Product(
    id: 12,
    name: 'Polarized Sunglasses',
    category: 'Accessories',
    image: _img('sunglasses.jpg'),
    price: 1800,
    rating: 4.0,
    description: 'Stylish UV400 polarized sunglasses with a lightweight frame.',
    isNew: true,
  ),

  Product(
    id: 13,
    name: 'Modern Table Lamp',
    category: 'Home',
    image: _img('table_lamp.jpg'),
    price: 1650,
    rating: 4.3,
    description:
    'Minimal table lamp with a warm light that adds a cozy feel to any room.',
  ),
  Product(
    id: 14,
    name: 'Ceramic Coffee Mug Set',
    category: 'Home',
    image: _img('coffee_mugs.jpg'),
    price: 999,
    rating: 4.2,
    description:
    'Set of two handcrafted ceramic mugs, microwave and dishwasher safe.',
    discountPercent: 10,
  ),
];

List<Product> productsByCategory(String categoryName) {
  if (categoryName == 'All') return products;
  return products.where((p) => p.category == categoryName).toList();
}