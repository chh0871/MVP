import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/models/model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  void _openProduct(BuildContext context) {

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openProduct(context),
      child: Container(
        child: Text(
          product.name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
