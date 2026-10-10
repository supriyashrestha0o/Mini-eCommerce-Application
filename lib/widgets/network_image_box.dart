import 'package:flutter/material.dart';

class NetworkImageBox extends StatelessWidget {
  final String url;
  final BoxFit fit;

  const NetworkImageBox({super.key, required this.url, this.fit = BoxFit.cover});

  Widget _placeholder() => const Center(
    child: Icon(Icons.image_not_supported_outlined,
        size: 32, color: Colors.grey),
  );

  @override
  Widget build(BuildContext context) {
    // Web URL
    if (url.startsWith('http')) {
      return Image.network(
        url,
        fit: fit,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        },
        errorBuilder: (context, error, stackTrace) => _placeholder(),
      );
    }

    // Local asset
    return Image.asset(
      url,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) => _placeholder(),
    );
  }
}