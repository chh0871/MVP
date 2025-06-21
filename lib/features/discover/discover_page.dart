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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            DiscoverSelectionBar(),
            SizedBox(height: 30,),
            DiscoverCharityCard(
              title: dummyCharity["title"] as String,
              description: dummyCharity["description"] as String,
              imagePath: dummyCharity["imagePath"] as String,
              logoPath: dummyCharity["logoPath"] as String,
              likes: dummyCharity["likes"] as int,
            ),
            SizedBox(
              height: 30,
            ),
            ItemsInSupport(),
          ],
        ),
      appBar: const DiscoverHeader(),
      body: Consumer<DiscoverViewModel>(
        builder: (context, viewModel, _) {
          final charities = viewModel.fetchCharities();
          return DiscoverCharityList(charities: charities);
        },
      ),
    );
  }
}
