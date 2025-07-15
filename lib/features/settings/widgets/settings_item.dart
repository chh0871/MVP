import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/config/config.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final String trailing;

  const SettingsItem(
      {super.key, required this.title, this.onTap, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      trailing,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.chevron_right,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      size: 26,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
