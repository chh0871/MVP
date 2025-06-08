import 'package:cherry_mvp/core/config/app_colors.dart';
import 'package:cherry_mvp/core/config/app_images.dart';
import 'package:cherry_mvp/core/models/model.dart';
import 'package:cherry_mvp/core/models/user.dart';
import 'package:cherry_mvp/core/models/user_section.dart';
import 'package:cherry_mvp/core/reusablewidgets/image_carousel.dart';
import 'package:cherry_mvp/features/home/home_model.dart';
import 'package:cherry_mvp/features/products/product_information.dart';
import 'package:cherry_mvp/features/products/seller_information.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String productId;

  const ProductPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.width -
              MediaQuery.of(context).padding.top,
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ImageCarousel(images: [
                        AssetImage(AppImages.product1),
                        AssetImage(AppImages.product2),
                        AssetImage(AppImages.product3),
                      ]),
                    ),
                    PositionedDirectional(
                      end: 24,
                      bottom: 16,
                      child: Material(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: Row(
                            spacing: 4,
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 20,
                                color: AppColors.primary,
                              ),
                              Text(
                                '3',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: AppColors.primary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
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
            padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
          ),
          Divider(
            thickness: 8,
            color: AppColors.dividerColor,
          ),
          ProductInformation(
            product: dummyProducts.first,
            padding: EdgeInsets.all(16),
          ),
          Divider(thickness: 8, color: AppColors.dividerColor),
          ListTile(
            title: Text('Description'),
            subtitle: Text(dummyProducts.first.description),
            subtitleTextStyle: TextStyle(color: AppColors.greyTextColor),
          ),
          Divider(thickness: 8, color: AppColors.dividerColor),
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(0, 12, 16, 12),
            child: Column(
              spacing: 8,
              children: [
                ShadedTile(
                    child: Row(
                  children: [
                    Expanded(
                      child: Text('Open to other charities'),
                    ),
                    Expanded(
                      child: Text('Request other charity'),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 16, color: AppColors.primary),
                  ],
                )),
                ShadedTile()
              ],
            ),
          )
        ]),
      ],
    ));
  }
}

class ShadedTile extends StatelessWidget {
  final Widget? child;

  const ShadedTile({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(28), bottomRight: Radius.circular(28)),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            AppColors.primary.withValues(alpha: .1),
          ],
          begin: Alignment.centerLeft,
          end: Alignment(2, .5),
        ),
      ),
      child: child,
    );
  }
}
