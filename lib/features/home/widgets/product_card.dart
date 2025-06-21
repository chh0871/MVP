import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/models/model.dart';
import 'package:cherry_mvp/features/home/widgets/product_image_card.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image container
        AspectRatio(
          aspectRatio: 0.7, // You can tweak this for image height
          child: ProductImageCard(
            imagePath: product.product_image,
            likes: product.likes,
          ),
        ),

        const SizedBox(height: 6),

        // Details container (independent of image height)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Text(
                product.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),

              // Quality & Size
              Row(
                children: [
                  Text(
                    product.quality,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    product.size,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),

              const SizedBox(height: 2),

              // Price + Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '£${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        height: 1.0),
                  ),
                  Image.asset(
                    product.charity_image,
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ],
              ),

              const SizedBox(height: 2),

              // Final Price
              Text(
                '£${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 1.0,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
