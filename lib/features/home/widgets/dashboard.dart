import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cherry_mvp/features/home/home_viewmodel.dart';
import 'package:cherry_mvp/features/home/widgets/product_card.dart';
import 'package:cherry_mvp/core/config/config.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.dashboard,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: Consumer<HomeViewModel>(builder: (context, viewModel, _) {
          final products = viewModel.fetchProducts();

          return Padding(
              padding: const EdgeInsets.all(5),
              child: GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 8, // reduced spacing
                  childAspectRatio: 0.5, // tweak for card size fit
                ),
                itemCount: products.length,
                itemBuilder: (context, index) =>
                    ProductCard(product: products[index]),
              ));
        }));
  }
}
