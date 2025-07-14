import 'package:cherry_mvp/core/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppButtonStyle {
  static ButtonStyle exploreButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColors.redBgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      padding: EdgeInsets.fromLTRB(19, 3, 3, 3));
}
