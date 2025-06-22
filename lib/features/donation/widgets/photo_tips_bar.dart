import 'package:cherry_mvp/core/config/app_colors.dart';
import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:cherry_mvp/core/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'photo_tips_dialog.dart';  // import the new dialog widget

class PhotoTipsBar extends StatelessWidget {
  const PhotoTipsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 13),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.info_outline, color: AppColors.white, size: 30),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                AppStrings.catchEyesText,
                style: AppTextStyles.donatePhotoBarText1,
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
                style: AppTextStyles.donatePhotoBarText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
