import 'package:cherry_mvp/core/config/app_images.dart';
import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:cherry_mvp/core/models/user_section.dart';
import 'package:cherry_mvp/features/products/widgets/product_action_row.dart';
import 'package:cherry_mvp/features/products/widgets/product_bottom_spacer.dart';
import 'package:cherry_mvp/features/products/widgets/product_highlight_title.dart';
import 'package:cherry_mvp/features/products/widgets/product_information.dart';
import 'package:cherry_mvp/features/products/product_viewmodel.dart';
import 'package:cherry_mvp/features/products/widgets/seller_information.dart';
import 'package:cherry_mvp/features/products/widgets/product_header_carousel.dart';
import 'package:cherry_mvp/features/products/widgets/product_description_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductViewModel>(context);
    final product = viewModel.product;

    if (product == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('No product selected')),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProductHeaderCarousel(product),
          SliverList.list(children: [
            SellerInformation(
              user: UserInformation(
                username: 'John Doe',
                location: 'New York, USA',
                reviewsCount: 120,
                followersCount: 300,
                followingCount: 150,
                rating: 3.5,
                awards: 37,
                hasBuyerDiscounts: true,
              ),
              charity: Image.asset(AppImages.homeStart),
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            ),
            const Divider(thickness: 8),
            ProductInformation(
              product: product,
              padding: const EdgeInsets.all(16),
            ),
            const Divider(thickness: 8),
            ProductDescriptionSection(description: product.description),
            const Divider(thickness: 8),
            ProductHighlightTile(
              onTap: () {},
              leadingText: AppStrings.productPageBuyerDiscountActive,
              trailingText: AppStrings.productPageBuy2Get1HalfPrice,
              trailingIcon: const Icon(Icons.arrow_forward),
            ),
            ProductHighlightTile(
              onTap: () {},
              leadingText: AppStrings.productPageOpenToOtherCharities,
              trailingText: AppStrings.productPageRequestOtherCharity,
              trailingIcon: Image.asset(
                AppImages.sale,
                height: 24,
                width: 24,
              ),
            ),
            const ProductActionsRow(),
            const ProductBottomSpacer(),
          ]),
        ],
      ),
    );
  }
}
