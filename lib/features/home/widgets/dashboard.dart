import 'package:cherry_mvp/core/router/nav_provider.dart';
import 'package:cherry_mvp/core/router/nav_routes.dart';
import 'package:cherry_mvp/features/products/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cherry_mvp/features/home/home_viewmodel.dart';
import 'package:cherry_mvp/features/home/widgets/product_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, _) {
        final navigator = Provider.of<NavigationProvider>(context, listen: false);
        final productViewModel = Provider.of<ProductViewModel>(context, listen: false);
        final products = homeViewModel.fetchProducts();

        return Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.61,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      productViewModel.setProduct(products[index]);
                      navigator.navigateTo(AppRoutes.product);
                    },
                    child: ProductCard(product: products[index]),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
