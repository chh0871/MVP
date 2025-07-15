import 'package:cherry_mvp/core/config/app_colors.dart';
import 'package:cherry_mvp/core/config/app_images.dart';
import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:cherry_mvp/core/models/user_section.dart';
import 'package:cherry_mvp/core/widgets/profile_section_icontextrow.dart';
import 'package:flutter/material.dart';

class UserInformationSection extends StatelessWidget {
  final UserInformation userInformationSection;
  final VoidCallback onSettingsPressed;

  const UserInformationSection({
    super.key,
    required this.userInformationSection,
    required this.onSettingsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Top Greeting Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${AppStrings.greeting}, ${AppStrings.profileUserInfoSectionUser}!",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            GestureDetector(
              onTap: onSettingsPressed,
              child: Image.asset(
                AppImages.profilesettings,
                height: 35,
                width: 35,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        /// Profile Info Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  AppImages.profileProfileIcon,
                  height: 48,
                  width: 48,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userInformationSection.username,
                        style: Theme.of(context).textTheme.headlineLarge),
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < userInformationSection.rating
                                  ? Icons.star
                                  : Icons.star_border_outlined,
                              color: AppColors.yellow,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          '${userInformationSection.reviewsCount} ${AppStrings.profileUserInfoSectionBuyerReviews}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
        const SizedBox(height: 20),

        /// Stats Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Info Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconTextRow(
                  assetPath: AppImages.profileFollowers,
                  text:
                      '${userInformationSection.followingCount} ${AppStrings.profileUserInfoSectionFollowing}, ${userInformationSection.followersCount} ${AppStrings.profileUserInfoSectionFollowers}',
                ),
                IconTextRow(
                  assetPath: AppImages.profileLocation,
                  text: userInformationSection.location,
                ),
                IconTextRow(
                  assetPath: AppImages.profileemail,
                  text: AppStrings.email,
                ),
                if (userInformationSection.hasBuyerDiscounts)
                  IconTextRow(
                    assetPath: AppImages.profileDiscount,
                    text: AppStrings.profileUserInfoSectionBuyerDiscount,
                  ),
              ],
            ),

            /// Awards Column
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.profileAwards,
                  height: 23.33,
                  width: 36.66,
                ),
                const SizedBox(height: 4),
                Text(
                  "${userInformationSection.awards} ${AppStrings.profileUserInfoSectionBuyerAwards}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
