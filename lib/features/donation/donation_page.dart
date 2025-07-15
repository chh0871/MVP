import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:cherry_mvp/features/donation/widgets/photo_tips_bar.dart';
import 'widgets/donation_form.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text(AppStrings.donationsText),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: PhotoTipsBar(),
          ),
          SizedBox(height: 8),
          DonationForm(),
        ],
      ),
    );
  }
}
