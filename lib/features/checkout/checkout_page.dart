import 'package:cherry_mvp/core/config/app_strings.dart';
import 'package:cherry_mvp/features/basket/basket_service.dart';
import 'package:cherry_mvp/features/checkout/outlined.dart';
import 'package:cherry_mvp/features/checkout/price_list_item.dart';
import 'package:cherry_mvp/features/checkout/shipping_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<StatefulWidget> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? _delivery;
  var _deliverExpanded = false;

  @override
  Widget build(BuildContext context) {
    final basket = context.read<BasketService>();
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
              return Container(
                height: 140,
                margin: const EdgeInsets.all(16),
                child: Row(
                  spacing: 16,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                          ),
                          child: product.productImages.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    product.productImages.first,
                                    fit: BoxFit.cover,
                                  ))
                              : null),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(product.name),
                          Text(product.size),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${AppStrings.currencySymbol}${product.price.toStringAsFixed(2)}',
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
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.list(
              children: [
                Divider(height: 32),
                PriceListItem(
                  title: Text(AppStrings.checkoutOrderTotal),
                  price: basket.total,
                ),
                SizedBox(height: 4),
                PriceListItem(
                  title: Row(
                    spacing: 4,
                    children: [
                      Text(AppStrings.checkoutSecurityFee),
                      Icon(
                        Icons.info,
                        color: Theme.of(context).colorScheme.primary,
                        size: 16,
                      ),
                    ],
                  ),
                  price: basket.securityFee,
                ),
                SizedBox(height: 4),
                PriceListItem(
                  title: Text(AppStrings.checkoutPostage),
                  price: basket.postage,
                ),
                SizedBox(height: 8),
                PriceListItem(
                  title: Text(AppStrings.checkoutTotal,
                      style: Theme.of(context).textTheme.titleSmall),
                  price: basket.postage,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Divider(height: 32),
                Text(
                  AppStrings.checkoutDeliveryOption,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 8),
                ShippingListItem(
                  icon: Icons.location_on,
                  title: AppStrings.checkoutShipToPickup,
                  subtitle: AppStrings.checkoutPickupSubtitle,
                  value: _delivery,
                  groupValue: 'pickup',
                  onChanged: (value) => setState(
                    () => _delivery = value,
                  ),
                ),
                const SizedBox(height: 8),
                ShippingListItem(
                  icon: Icons.home,
                  title: AppStrings.checkoutShipToHome,
                  subtitle: AppStrings.checkoutHomeSubtitle,
                  value: _delivery,
                  groupValue: 'home',
                  onChanged: (value) => setState(
                    () {
                      _delivery = value;
                      _deliverExpanded = false;
                    },
                  ),
                ),
                if (_delivery == 'pickup') ...[
                  const SizedBox(height: 8),
                  Outlined(
                    child: ListTile(
                      onTap: () =>
                          setState(() => _deliverExpanded = !_deliverExpanded),
                      leading: Icon(Icons.map),
                      title: Text(AppStrings.checkoutPickupPoint),
                      trailing: _deliverExpanded
                          ? const Icon(Icons.expand_less)
                          : const Icon(Icons.expand_more),
                    ),
                  ),
                  SizedBox(height: 8),
                  if (_deliverExpanded)
                    Outlined(
                      child: Column(
                        children: [
                          CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                              AppStrings.checkoutPickupPoint1,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            subtitle: Text(AppStrings.checkoutPickupAddress1),
                            value: true,
                            onChanged: (value) {},
                          ),
                          Divider(height: 1),
                          CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(AppStrings.checkoutPickupPoint2,
                                style: Theme.of(context).textTheme.titleSmall),
                            subtitle: Text(AppStrings.checkoutPickupAddress2),
                            value: false,
                            onChanged: (value) {},
                          ),
                          Divider(height: 1),
                          CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(AppStrings.checkoutPickupPoint3,
                                style: Theme.of(context).textTheme.titleSmall),
                            subtitle: Text(AppStrings.checkoutPickupAddress3),
                            value: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                ],
                Divider(height: 16),
              ],
            ),
          ),
          SliverList.list(children: [
            ListTile(
              onTap: () {},
              title: Text(AppStrings.checkoutPayment),
              titleTextStyle: Theme.of(context).textTheme.labelMedium,
              subtitle: Text(AppStrings.checkoutChoosePayment),
              trailing: Icon(Icons.add),
              iconColor: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 32),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    size: 14,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
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
              padding: EdgeInsets.symmetric(
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
