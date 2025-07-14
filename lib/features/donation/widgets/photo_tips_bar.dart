import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:flutter/material.dart';
import 'photo_tips_dialog.dart'; // import the new dialog widget

class PhotoTipsBar extends StatelessWidget {
  const PhotoTipsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 13),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.info_outline,
                color: Theme.of(context).colorScheme.onPrimary, size: 30),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                AppStrings.catchEyesText,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (context) => const PhotoTipsDialog(),
              ),
              child: Text(
                AppStrings.learnHow,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
