import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:flutter/material.dart';
import 'photo_tips_dialog.dart'; // import the new dialog widget

class PhotoTipsBar extends StatelessWidget {
  const PhotoTipsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => PhotoTipsDialog(), // show the dialog on tap
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16,
              children: [
                Icon(Icons.info_outline,
                    color: Theme.of(context).colorScheme.onPrimary, size: 32),
                Flexible(
                  child: Text(
                    AppStrings.catchEyesText,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
                Text(
                  AppStrings.learnHow,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
