import 'package:cherry_mvp/core/config/config.dart';
import 'package:cherry_mvp/core/widgets/profile_user_order_details.dart';
import 'package:flutter/material.dart';

class UserOrderDetails extends StatelessWidget {
  const UserOrderDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              UserOrderTile(
                  title: AppStrings.profile_user_orders,
                  onPressed: () {},
                  assetPath: AppImages.profileOrder),
              UserOrderTile(
                  title: AppStrings.profile_user_liked,
                  onPressed: () {},
                  assetPath: AppImages.profileLiked),
              UserOrderTile(
                  title: AppStrings.profile_user_listings,
                  onPressed: () {},
                  assetPath: AppImages.profileListings),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: 41,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.profile_user_Buyer_disc,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              Image.asset(
                AppImages.profileDiscount,
                color: Theme.of(context).colorScheme.primary,
                height: 18,
                width: 18,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
