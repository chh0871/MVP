import 'package:cherry_mvp/core/config/app_colors.dart';
import 'package:flutter/material.dart';

class DiscoverSelectionBar extends StatefulWidget {
  const DiscoverSelectionBar({super.key});

  @override
  State<DiscoverSelectionBar> createState() => _DiscoverSelectionBarState();
}

class _DiscoverSelectionBarState extends State<DiscoverSelectionBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(3),
        child: SizedBox(
          width: double.infinity,
          height: 40, // Ensures the Row takes the full width available
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Popular",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Smaller Charities",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Local to you",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
