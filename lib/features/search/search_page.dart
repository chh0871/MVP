import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/reusablewidgets/empty_state_card.dart';
import 'package:cherry_mvp/core/config/config.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.search,
          textAlign: TextAlign.center,
        ),
      ),
      body: EmptyStateCard(
        message: AppStrings.emptyStateSearchText,
      ),
    );
  }
}
