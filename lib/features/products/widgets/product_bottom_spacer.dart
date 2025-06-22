import 'package:flutter/material.dart';

class ProductBottomSpacer extends StatelessWidget {
  const ProductBottomSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).padding.bottom);
  }
}
