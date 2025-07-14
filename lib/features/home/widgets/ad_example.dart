import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/config/config.dart';

class AdExample extends StatelessWidget {
  const AdExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(AppStrings.adText,
              style: Theme.of(context).textTheme.titleMedium),
        ),
        Image.asset(AppImages.ad_image),
      ],
    );
  }
}
