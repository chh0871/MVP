import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cherry_mvp/features/discover/discover_viewmodel.dart';
import 'package:cherry_mvp/features/discover/widgets/discover_charity_list.dart';
import 'package:cherry_mvp/features/discover/widgets/discover_selection_bar.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DiscoverViewModel>(
        builder: (context, viewModel, _) {
          final charities = viewModel.fetchCharities();
          final products = viewModel.fetchProducts();

          return CustomScrollView(
            slivers: [
              PinnedHeaderSliver(
                  child: SizedBox(height: MediaQuery.of(context).padding.top)),
              SliverAppBar(title: Text('Discover'), primary: false),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                sliver: PinnedHeaderSliver(child: const DiscoverSelectionBar()),
              ),
              DiscoverCharityList(
                charities: charities,
                products: products,
              ),
            ],
          );
        },
      ),
    );
  }
}
