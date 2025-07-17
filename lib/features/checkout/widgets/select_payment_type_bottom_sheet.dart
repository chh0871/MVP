import 'package:cherry_mvp/features/checkout/payment_type.dart';
import 'package:flutter/material.dart';

class SelectPaymentTypeBottomSheet extends StatefulWidget {
  const SelectPaymentTypeBottomSheet({super.key});

  @override
  State<SelectPaymentTypeBottomSheet> createState() =>
      _SelectPaymentTypeBottomSheetState();
}

class _SelectPaymentTypeBottomSheetState
    extends State<SelectPaymentTypeBottomSheet> {
  PaymentType? _selected;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      shape: BeveledRectangleBorder(),
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            width: double.infinity,
            child: Text(
              'Payment Methods',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            title: Text(
                'Your payment information will never be shared with the seller'),
            titleTextStyle: Theme.of(context).textTheme.bodySmall,
            textColor: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Card'),
            trailing: Radio.adaptive(
                value: PaymentType.card,
                groupValue: _selected,
                onChanged: (value) {
                  setState(() => _selected = value);
                }),
            onTap: () => setState(() => _selected = PaymentType.card),
          ),
          const Divider(height: 1),
          ListTile(
            leading: Image.asset(
              'assets/images/google.png',
              width: 24,
              height: 24,
            ),
            title: Text('Google Pay'),
            trailing: Radio.adaptive(
                value: PaymentType.google,
                groupValue: _selected,
                onChanged: (value) {
                  setState(() => _selected = value);
                }),
            onTap: () => setState(() => _selected = PaymentType.google),
          ),
          const Divider(height: 1),
          ListTile(
            leading: Image.asset(
              'assets/images/apple.png',
              width: 24,
              height: 24,
            ),
            title: Text('Apple Pay'),
            trailing: Radio.adaptive(
                value: PaymentType.apple,
                groupValue: _selected,
                onChanged: (value) {
                  setState(() => _selected = value);
                }),
            onTap: () => setState(() => _selected = PaymentType.apple),
          ),
          const SizedBox(height: 32),
          Container(
            height: 48,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton(
              style: FilledButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.surface,
                backgroundColor: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: _selected != null
                  ? () => Navigator.pop(context, _selected)
                  : null,
              child: Text('Pay'),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}
