import 'package:cherry_mvp/core/config/config.dart';
import 'package:flutter/material.dart';
 
InputDecoration buildInputDecorationSearchHome({required String labelText, required String hintText, IconData? iconPrefix, IconData? icon, double? enabledBorderRadiusValue, Color? iconColor}) { 
  return InputDecoration(  
    labelText: labelText, // Label above the TextField
    hintText: hintText, // Placeholder inside the TextField 
    labelStyle: TextStyle(color: AppColors.greyTextColor, fontSize: 15), // Styling the label
    hintStyle: TextStyle(color: AppColors.greyTextColor, fontSize: 13), // Styling the placeholder
    border: OutlineInputBorder( // Adds a border around the TextField
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: AppColors.greyTextColor),
    ), 
    focusedBorder: OutlineInputBorder( 
      borderRadius: BorderRadius.circular(enabledBorderRadiusValue ?? 10.0),
      borderSide: BorderSide(color: AppColors.greyTextColor, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder( 
      borderRadius: BorderRadius.circular(enabledBorderRadiusValue ?? 10.0),
      borderSide: BorderSide(color: AppColors.greyTextColor, width: 1.0), 
    ),  
  
    prefixIcon: iconPrefix != null ? Icon(
      iconPrefix, 
      color: AppColors.greyTextColor
    ): null,
    suffixIcon: icon != null ? Icon(
      icon, 
      color: iconColor ?? AppColors.greyTextColor
    ): null,
    filled: true, 
    fillColor: AppColors.lightGreyFill, // Background color
  );
}