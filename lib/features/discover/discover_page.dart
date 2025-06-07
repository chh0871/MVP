import 'package:cherry_mvp/core/config/app_colors.dart';
import 'package:cherry_mvp/features/discover/widgets/discover_charity_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cherry_mvp/features/discover/discover_viewmodel.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Consumer<DiscoverViewModel>(
        builder: (context, viewModel, _) {
          final charities = viewModel.fetchCharities();

          return ListView.builder(
            padding: const EdgeInsets.all(18.0),
            itemCount: charities.length,
            itemBuilder: (context, index) {
              final charity = charities[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: DiscoverCharityCard(
                  title: charity.charityName,
                  description: charity.description,
                  imagePath: charity.charityImage,
                  logoPath: charity.charityLogo,
                  likes: charity.likes,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

