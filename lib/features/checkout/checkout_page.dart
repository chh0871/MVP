import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:cherry_mvp/features/checkout/checkout_view_model.dart';
import 'package:cherry_mvp/features/checkout/widgets/basket_list_item.dart';
import 'package:cherry_mvp/features/checkout/widgets/delivery_options.dart';
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
    final basket = context.read<CheckoutViewModel>();
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: Text(AppStrings.checkoutTitle),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: basket.basketItems.length,
            itemBuilder: (context, index) {
              final product = basket.basketItems[index];
              return BasketListItem(
                product: product,
                onRemove: () => basket.removeItem(product),
              );
            },
          ),
          DeliveryOptions(),
          SliverList.list(children: [
            ListTile(
              onTap: () {},
              title: const Text(AppStrings.checkoutPayment),
              titleTextStyle: Theme.of(context).textTheme.labelMedium,
              subtitle: const Text(AppStrings.checkoutChoosePayment),
              trailing: const Icon(Icons.add),
              iconColor: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 32),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.lock,
                    size: 14,
                  ),
                  Text(
                    AppStrings.checkoutSecure,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              height: 56,
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                child: Text(AppStrings.checkoutPay),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
          ])
        ],
      ),
    );
  }
}
