import 'package:cherry_mvp/core/router/nav_provider.dart';
import 'package:cherry_mvp/core/router/nav_routes.dart';
import 'package:cherry_mvp/features/products/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cherry_mvp/features/home/home_viewmodel.dart';
import 'package:cherry_mvp/features/products/product_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, _) {
        final navigator =
            Provider.of<NavigationProvider>(context, listen: false);
        final productViewModel =
            Provider.of<ProductViewModel>(context, listen: false);
        final products = homeViewModel.fetchProducts();
        final mq = MediaQuery.of(context);
        final w = (mq.size.width - 32) / 2;
        final h = w + mq.textScaler.scale(100);
        return SliverGrid.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: w / h,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
                product: products[index],
                onTap: () {
                  productViewModel.setProduct(products[index]);
                  navigator.navigateTo(AppRoutes.product);
                });
          },
        );
      },
    );
  }
}
