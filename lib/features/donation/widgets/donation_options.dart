import 'package:cherry_mvp/features/donation/widgets/donation_option.dart';
import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/config/config.dart';

class DonationOptions extends StatelessWidget {
  const DonationOptions({
    super.key,
    required this.isSwitchedOpenToOtherCharity,
    required this.toggleSwitchOpenToOtherCharity,
    required this.isSwitchedOpenToOffer,
    required this.toggleSwitchOpenToOffer,
    required this.isSwitchedApplicableBuyerDiscounts,
    required this.toggleSwitchApplicableBuyerDiscounts,
  });

  final bool isSwitchedOpenToOtherCharity;
  final void Function(bool)? toggleSwitchOpenToOtherCharity;

  final bool isSwitchedOpenToOffer;
  final void Function(bool)? toggleSwitchOpenToOffer;

  final bool isSwitchedApplicableBuyerDiscounts;
  final void Function(bool)? toggleSwitchApplicableBuyerDiscounts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            AppStrings.donation_options_Text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          subtitle: Text(
            '${AppStrings.give_your_buyer_Text}\n${AppStrings.easy_way_Text}',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            spacing: 8,
            children: [
              DonationOption(
                labelText: AppStrings.open_to_other_charities_Text,
                value: isSwitchedOpenToOtherCharity,
                onChanged: toggleSwitchOpenToOtherCharity ?? (value) {},
              ),
              DonationOption(
                labelText: AppStrings.open_to_offers_Text,
                value: isSwitchedOpenToOffer,
                onChanged: toggleSwitchOpenToOffer ?? (value) {},
              ),
              DonationOption(
                labelText: AppStrings.applicable_for_buyer_discounts_Text,
                value: isSwitchedApplicableBuyerDiscounts,
                onChanged: toggleSwitchApplicableBuyerDiscounts ?? (value) {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
