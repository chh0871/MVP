import 'package:cherry_mvp/core/config/app_colors.dart';
import 'package:cherry_mvp/core/config/app_images.dart';
import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:cherry_mvp/core/config/app_text_styles.dart';
import 'package:flutter/material.dart';

class UserInformationSection extends StatelessWidget {
  final String username;
  final String location;
  final int reviewsCount;
  final int followersCount;
  final int followingCount;
  final double rating;
  final int awards;
  final bool hasBuyerDiscounts;

  const UserInformationSection({
    super.key,
    required this.username,
    required this.awards,
    required this.location,
    required this.reviewsCount,
    required this.followersCount,
    required this.followingCount,
    required this.rating,
    this.hasBuyerDiscounts = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${AppStrings.greeting}, ${AppStrings.profile_user_info_section_user}!",
              style: AppTextStyles.bodyText_profile_heading,
            ),
            Image.asset(
              AppImages.profile_settings,
              height: 35,
              width: 35,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  AppImages.profile_profileIcon,
                  height: 46.67,
                  width: 46.67,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username,
                        style: AppTextStyles.bodyText_profile_heading2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  index < rating
                                      ? Icons.star
                                      : Icons.star_border_outlined,
                                  color: AppColors.profile_review,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                                '$reviewsCount ${AppStrings.profile_user_info_section_buyer_reviews}',
                                style:
                                    AppTextStyles.bodyText_profile_subheading),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: AppColors.greyTextColorTwo),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppImages.profile_followers,
                      height: 16,
                      width: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                        '$followingCount ${AppStrings.profile_user_info_section_following}, $followersCount ${AppStrings.profile_user_info_section_followers}',
                        style: AppTextStyles.bodyText_profile_subheading),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Image.asset(
                      AppImages.profile_location,
                      height: 16,
                      width: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(location,
                        style: AppTextStyles.bodyText_profile_subheading),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Image.asset(
                      AppImages.profile_email,
                      height: 16,
                      width: 16,
                    ),
                    SizedBox(width: 8),
                    Text(AppStrings.email,
                        style: AppTextStyles.bodyText_profile_subheading),
                  ],
                ),
                if (hasBuyerDiscounts) const SizedBox(height: 8),
                if (hasBuyerDiscounts)
                  Row(
                    children: [
                      Image.asset(
                        AppImages.profile_discount,
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(width: 8),
                      Text(
                          "${AppStrings.profile_user_info_section_buyer_discount}",
                          style: AppTextStyles.bodyText_profile_subheading),
                    ],
                  ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.profile_awards,
                  height: 23.33,
                  width: 36.66,
                ),
                SizedBox(height: 4),
                Text(
                    "$awards ${AppStrings.profile_user_info_section_buyer_awards}",
                    style: AppTextStyles.bodyText_profile_subheading),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
