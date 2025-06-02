import 'package:cherry_mvp/core/config/config.dart';
import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/models/model.dart';
import 'package:cherry_mvp/core/config/app_images.dart';
import 'package:cherry_mvp/features/home/widgets/product_image_card.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          ProductImageCard(
            imagePath: AppImages.product1, // or product.image if dynamic
            likes: product.likes,
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
