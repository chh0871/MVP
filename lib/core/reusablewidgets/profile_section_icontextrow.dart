import 'package:cherry_mvp/core/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class IconTextRow extends StatelessWidget {
  final String assetPath;
  final String text;

  const IconTextRow({
    Key? key,
    required this.assetPath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              assetPath,
              height: 16,
              width: 16,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: AppTextStyles.bodyText_profile_subheading,
            ),
          ],
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}
