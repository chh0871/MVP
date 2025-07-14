import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/models/model.dart';
import '../../../core/widgets/product_image_card.dart';
import 'product_info_card.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  static const double radius = 4;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ProductImageCard(
              product: product
            ),
          ),
          ProductInfoCard(product: product),
        ],
      ),
    );
  }
}
