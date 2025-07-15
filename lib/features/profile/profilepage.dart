import 'package:cherry_mvp/core/config/config.dart';
import 'package:cherry_mvp/core/models/user_section.dart';
import 'package:cherry_mvp/features/profile/widgets/donation_impact_tracker.dart';
import 'package:cherry_mvp/features/profile/widgets/user_activity_cards.dart';
import 'package:cherry_mvp/features/profile/widgets/user_information_section.dart';
import 'package:cherry_mvp/features/profile/widgets/user_order_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cherry_mvp/core/router/router.dart';

class ProfilePage extends StatelessWidget {
  final List<Color> charityColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange
  ];

  final List<double> charityValues = [40, 30, 20, 10];

  final List<String> charityLabels = [
    'Charity A',
    'Charity B',
    'Charity C',
    'Charity D'
  ];
  final Map<String, dynamic> userInfoMap = {
    'username': AppStrings.profileUserInfoUsername,
    'location': AppStrings.profileUserInfoLocation,
    'reviewsCount': 0,
    'followersCount': 0,
    'followingCount': 0,
    'rating': 0.0,
    'awards': 0,
    'hasBuyerDiscounts': true,
  };

  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToSettings() {
      final navigator = Provider.of<NavigationProvider>(context, listen: false);
      navigator.navigateTo(AppRoutes.settingspage);
    }

    return Scaffold(
      //profile header
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.profileUserInfoTitle),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //user information section
                UserInformationSection(
                  userInformationSection: UserInformation.fromJson(userInfoMap),
                  onSettingsPressed: () {
                    navigateToSettings();
                  },
                ),
                //user order details
                UserOrderDetails(),
                //donation chart
                DonationChart(
                  totalAmount: 365.00,
                  donations: {
                    'BHF': 183,
                    'Samaritans': 92,
                    'Cancer Research': 47,
                    'RNLI': 43,
                  },
                  colors: {
                    'BHF': AppColors.red,
                    'Samaritans': AppColors.pink,
                    'Cancer Research': AppColors.green, //pink
                    'RNLI': AppColors.purple, //blue
                  },
                ),

                // User activity cards
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      UserActivityCards(
                          title: AppStrings.profileUserActivityBought,
                          value: '0'),
                      SizedBox(width: 10),
                      UserActivityCards(
                          title: AppStrings.profileUserActivitySold,
                          value: '0'),
                      SizedBox(width: 10),
                      UserActivityCards(
                          title: AppStrings.profileUserActivityTotal,
                          value: '0'),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  child: FilledButton(
                    onPressed: () {},
                    child: Text(AppStrings.share),
                  ),
                ),

                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
