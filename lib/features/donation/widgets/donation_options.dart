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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        AppStrings.donation_options_Text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
      Text(
        AppStrings.give_your_buyer_Text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
      ),
      Text(
        AppStrings.easy_way_Text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
      ),
      Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          margin: EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              AppStrings.open_to_other_charities_Text,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
            Switch.adaptive(
              value: isSwitchedOpenToOtherCharity,
              onChanged: toggleSwitchOpenToOtherCharity,
              inactiveTrackColor:
                  Theme.of(context).colorScheme.onSurfaceVariant,
              activeTrackColor: Theme.of(context).colorScheme.primary,
            )
          ])),
      Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          margin: EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              AppStrings.open_to_offers_Text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            Switch.adaptive(
              value: isSwitchedOpenToOffer,
              onChanged: toggleSwitchOpenToOffer,
              inactiveTrackColor:
                  Theme.of(context).colorScheme.onSurfaceVariant,
              activeTrackColor: Theme.of(context).colorScheme.primary,
            )
          ])),
      Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          margin: EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              AppStrings.applicable_for_buyer_discounts_Text,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
            Switch.adaptive(
              value: isSwitchedApplicableBuyerDiscounts,
              onChanged: toggleSwitchApplicableBuyerDiscounts,
              inactiveTrackColor:
                  Theme.of(context).colorScheme.onSurfaceVariant,
              activeTrackColor: Theme.of(context).colorScheme.primary,
            )
          ])),
    ]);
  }
}
