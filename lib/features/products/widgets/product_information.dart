import 'package:cherry_mvp/core/config/app_colors.dart';
import 'package:cherry_mvp/core/models/model.dart';
import 'package:flutter/material.dart';

class ProductInformation extends StatelessWidget {
  final Product product;
  final EdgeInsets? padding;

  const ProductInformation({super.key, required this.product, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.name),
          SizedBox(height: 4.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              SizedBox(
                width: 110,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('£${product.donation.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant)),
                    Row(
                      spacing: 4,
                      children: [
                        Text('£${product.price.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary)),
                        Icon(
                          Icons.verified_user,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 48,
                child: Text(product.size,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant)),
              ),
              Expanded(
                child: Text(product.quality,
                    style: TextStyle(color: AppColors.green)),
              ),
              Icon(
                Icons.workspace_premium,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          )
        ],
      ),
    );
  }
}
