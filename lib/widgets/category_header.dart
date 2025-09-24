import 'package:flutter/material.dart';
import '../models/product.dart';

class CategoryHeader extends StatelessWidget {
  final String category;
  final List<Product> products;

  const CategoryHeader({
    Key? key,
    required this.category,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).primaryColor.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            '${products.length} produits disponibles',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Prix moyen: ${(products.map((p) => p.price).reduce((a, b) => a + b) / products.length).toStringAsFixed(2)} €',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
} 