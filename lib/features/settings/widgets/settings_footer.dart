import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/config/config.dart';

class SettingsFooter extends StatelessWidget {
  const SettingsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(children: [
      ListTile(
        title: Text(AppStrings.deleteAccountText),
        textColor: Theme.of(context).colorScheme.primary,
        onTap: () {},
      ),
      ListTile(
        title: Text(AppStrings.appName),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
        subtitle: Text(AppStrings.appVersion),
        subtitleTextStyle: Theme.of(context).textTheme.labelLarge,
      ),
    ]);
  }
}
