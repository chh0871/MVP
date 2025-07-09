import 'package:cherry_mvp/core/models/product.dart';
import 'package:flutter/material.dart';
import 'package:cherry_mvp/features/discover/widgets/discover_charity_card.dart';
import 'package:cherry_mvp/core/models/charity_category.dart';
import 'package:cherry_mvp/features/discover/widgets/items_in_support.dart';

class DiscoverCharityList extends StatelessWidget {
  final List<Charity> charities;
  final List<Product> products;

  const DiscoverCharityList(
      {required this.charities, required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Important!
      itemCount: charities.length,
      itemBuilder: (context, index) {
        final charity = charities[index];

        return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(children: [
              DiscoverCharityCard(
                title: charity.charityName,
                description: charity.description,
                imagePath: charity.charityImage,
                logoPath: charity.charityLogo,
                likes: charity.likes,
              ),
              ItemsInSupport(products: products),
              const SizedBox(height: 30),
            ]));
      },
    );
  }
}
