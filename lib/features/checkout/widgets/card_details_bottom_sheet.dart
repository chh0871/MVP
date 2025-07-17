import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CardDetailsBottomSheet extends StatefulWidget {
  const CardDetailsBottomSheet({super.key});

  @override
  State<CardDetailsBottomSheet> createState() => _CardDetailsBottomSheetState();
}

class _CardDetailsBottomSheetState extends State<CardDetailsBottomSheet> {
  bool _saveCardDetails = false;

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
              'Card Details',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Card Number',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 2),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '1234 5678 9012 3456',
                    suffixIcon: Icon(Icons.credit_card),
                  ),
                  inputFormatters: [
                    MaskTextInputFormatter(
                      mask: '#### #### #### ####',
                      filter: {
                        '#': RegExp(r'[0-9]'),
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'MM/YY'),
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '##/##',
                            filter: {
                              '#': RegExp(r'[0-9]'),
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'CVC'),
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '###',
                            filter: {
                              '#': RegExp(r'[0-9]'),
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CheckboxListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text('Save card details for future payments'),
                  value: _saveCardDetails,
                  onChanged: (value) =>
                      setState(() => _saveCardDetails = value ?? false),
                ),
                SizedBox(height: 16),
                Text(
                  'Country or region',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 2),
                DropdownButtonFormField(
                  items: [],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 4),
                CheckboxListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    'Agree to save these card details for faster checkout. You can remove the card anytime in settings, under payments.',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  value: false,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Container(
            height: 48,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Save and use this card'),
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 48,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton(
              style: FilledButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.surface,
                backgroundColor: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: () => Navigator.pop(context),
              child: Text('Save'),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}
