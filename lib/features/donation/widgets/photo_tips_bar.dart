import 'package:cherry_mvp/core/config/app_colors.dart';
import 'package:cherry_mvp/core/config/app_images.dart';
import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:cherry_mvp/core/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class PhotoTipsBar extends StatelessWidget {
  const PhotoTipsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 13),
        child: Row(
          children: [
            Icon(Icons.info_outline, color: AppColors.white, size: 30),
            SizedBox(width: 10,),
            Text(AppStrings.catchEyes, style: AppTextStyles.donatePhotoBarText1,),
            Spacer(),
            GestureDetector(
              onTap: () => showDialog(context: context, builder: (BuildContext context) => AlertDialog(
                title: Text(AppStrings.photosTipPopupHeading, style: AppTextStyles.photoTipsHeadingText,),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AppImages.targetIcon, width: 20, height: 20,),
                        SizedBox(width: 13,),
                        Flexible(
                          child: Text(AppStrings.clearWellLit, style: AppTextStyles.photoTipsBodyText,),
                        )
                      ],
                    ),
                    SizedBox(height: 16,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AppImages.tshirtIcon, width: 20, height: 20,),
                        SizedBox(width: 13,),
                        Flexible(
                          child: Text(AppStrings.multipleAngles, style: AppTextStyles.photoTipsBodyText,),
                        )
                      ],
                    ),
                    SizedBox(height: 16,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AppImages.wandIcon, width: 20, height: 20,),
                        SizedBox(width: 13,),
                        Flexible(
                          child: Text(AppStrings.noFilters, style: AppTextStyles.photoTipsBodyText,),
                        )
                      ],
                    ),
                    SizedBox(height: 16,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AppImages.rulerIcon, width: 20, height: 20,),
                        SizedBox(width: 13,),
                        Flexible(
                          child: Text(AppStrings.showItOff, style: AppTextStyles.photoTipsBodyText,),
                        )
                      ],
                    ),
                  ],
                ),
                actions: [
                  SizedBox(width: double.infinity, child: TextButton( style: TextButton.styleFrom(backgroundColor: AppColors.primary), onPressed:() => Navigator.pop(context, "OK"), child: Text(AppStrings.okText, style: AppTextStyles.okButtonTextStyle,))
                  )],
              )
              ),
              child: Text(AppStrings.learnHow, style: AppTextStyles.donatePhotoBarText2,),
            )
          ],
        )
      ),
    );
  }
}