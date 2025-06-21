import 'package:cherry_mvp/core/config/config.dart';
import 'package:flutter/material.dart';

InputDecoration buildInputDecorationFormField({required String hintText, IconData? icon, IconData? iconSuffix}) {
  return InputDecoration(
      filled: true, 
      fillColor: AppColors.white,
      border:  const OutlineInputBorder(), 
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: AppColors.textFormOutline, width: 1.5),
      ), 
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 14, color: AppColors.black),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
      ),
      prefixIcon: icon != null ? Icon(icon, color: AppColors.greyTextColor) : null,
      suffixIcon: iconSuffix != null ? Icon(iconSuffix, color: AppColors.greyTextColor) : null,
      errorMaxLines: 3
  );
}