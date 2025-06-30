import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:flutter/material.dart';

class ProductActionsRow extends StatelessWidget {
  const ProductActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 64,
              child: OutlinedButton(
                onPressed: () {},
                child: Text(AppStrings.productPageMakeOffer),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 64,
              child: FilledButton(
                onPressed: () {},
                child: Text(AppStrings.productPageBuyNow),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
