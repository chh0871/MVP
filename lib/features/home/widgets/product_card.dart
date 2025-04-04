import 'package:cherry_mvp/core/config/config.dart';
import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/models/model.dart';
import 'add_to_cart_success.dart'; // just added this

class SingleProduct extends StatelessWidget {
  const SingleProduct({super.key, required this.product});

  final Product product;

  void addToCart(BuildContext context) {
    // this can be changed to a high level CI later
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddToCartSuccessPage(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Image.asset(
                  product.product_image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: Container(
                width: 28,
                height: 18,
                decoration: BoxDecoration(
                  color: AppColors.greenBgColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    product.number.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Image.asset(
                  product.charity_image,
                  width: 45,
                  height: 40,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 3, 8, 4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Image.asset(AppImages.likeHeart, width: 16, height: 14),
                    const SizedBox(width: 4),
                    Text(
                      product.likes.toString(),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          product.name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          '£${product.price.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => addToCart(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.greenBgColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text("Add to Cart", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
