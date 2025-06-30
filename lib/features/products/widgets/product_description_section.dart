import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:flutter/material.dart';

class ProductDescriptionSection extends StatelessWidget {
  final String description;
  const ProductDescriptionSection({required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AppStrings.productPageDescription),
      titleTextStyle: Theme.of(context).textTheme.titleSmall,
      subtitle: Text(description),
      subtitleTextStyle: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
