import 'package:cherry_mvp/core/config/app_colors.dart';
import 'package:cherry_mvp/core/config/app_images.dart';
import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:cherry_mvp/core/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class PhotoTipsDialog extends StatelessWidget {
  const PhotoTipsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        AppStrings.photosTipPopupHeading,
        style: AppTextStyles.photoTipsHeadingText,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTipRow(AppImages.targetIcon, AppStrings.clearWellLit),
          const SizedBox(height: 16),
          _buildTipRow(AppImages.tshirtIcon, AppStrings.multipleAngles),
          const SizedBox(height: 16),
          _buildTipRow(AppImages.wandIcon, AppStrings.noFilters),
          const SizedBox(height: 16),
          _buildTipRow(AppImages.rulerIcon, AppStrings.showItOff),
        ],
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            onPressed: () => Navigator.pop(context, "OK"),
            child: Text(
              "Ok",
              style: AppTextStyles.okButtonTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTipRow(String iconPath, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(iconPath, width: 20, height: 20),
        const SizedBox(width: 13),
        Flexible(
          child: Text(text, style: AppTextStyles.photoTipsBodyText),
        ),
      ],
    );
  }
}
