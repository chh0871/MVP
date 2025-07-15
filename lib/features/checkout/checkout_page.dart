import 'package:cherry_mvp/features/basket/basket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<StatefulWidget> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    final basket = context.read<BasketService>();
    return Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        title: Text('Checkout'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: basket.basketItems.length,
            itemBuilder: (context, index) {
              final product = basket.basketItems[index];
              return Container(
                height: 140,
                margin: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                          child: product.productImages.isNotEmpty
                              ? Image.asset(product.productImages.first)
                              : null),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(product.name),
                          Text(product.size),
                          const SizedBox(height: 8),
                          Row(children: [
                            Expanded(
                              child: Text(
                                '£${product.price.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            Material(
                              clipBehavior: Clip.antiAlias,
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(8),
                              elevation: 4,
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.asset(product.charityImage),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
