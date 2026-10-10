import 'package:flutter/material.dart';

import 'core/app_theme.dart';
import 'screens/home_page.dart';

void main() => runApp(const MyShopApp());

class MyShopApp extends StatelessWidget {
  const MyShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomePage(),
    );
  }
}