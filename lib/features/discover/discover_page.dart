import 'package:cherry_mvp/core/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cherry_mvp/features/discover/discover_viewmodel.dart';
import 'package:cherry_mvp/features/discover/widgets/discover_header.dart';
import 'package:cherry_mvp/features/discover/widgets/discover_charity_list.dart';
import 'package:cherry_mvp/core/config/app_images.dart';
import 'package:cherry_mvp/features/discover/widgets/discover_charity_card.dart';
import 'package:cherry_mvp/features/discover/widgets/discover_selection_bar.dart';
import 'package:cherry_mvp/features/discover/widgets/items_in_support.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const DiscoverHeader(),
      body: Consumer<DiscoverViewModel>(
        builder: (context, viewModel, _) {
          final charities = viewModel.fetchCharities();

          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                DiscoverSelectionBar(),
                const SizedBox(height: 30),
                const ItemsInSupport(),
                DiscoverCharityList(charities: charities),
              ],
            ),
          );
        },
      ),
    );
  }
}
