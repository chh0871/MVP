import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/models/model.dart';
import 'package:cherry_mvp/features/settings/widgets/settings_item.dart';

class SettingsCategoryGroup extends StatelessWidget {
  const SettingsCategoryGroup({
    super.key,
    required this.children,
    required this.heading,
  });

  final List<SectionSettingsItem> children;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Text(
          heading,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ),
      ...children.map((item) => SettingsItem(
          title: item.title, onTap: () {}, trailing: item.trailing)),
    ]);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('heading', heading));
  }
}
