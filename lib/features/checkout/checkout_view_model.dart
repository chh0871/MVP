import 'package:cherry_mvp/core/models/product.dart';
import 'package:flutter/material.dart';

class CheckoutViewModel extends ChangeNotifier {
  final List<Product> _basketItems = [];

  List<Product> get basketItems => List.unmodifiable(_basketItems);

  double get itemTotal => _basketItems.fold(0, (sum, item) => sum + item.price);

  double get securityFee => itemTotal * 0.1;

  double get postage => 2.99;

  double get total => itemTotal + securityFee + postage;

  void addItem(Product product) {
    _basketItems.add(product);
    notifyListeners();
  }

  void removeItem(Product product) {
    _basketItems.remove(product);
    notifyListeners();
  }

  void clearBasket() {
    _basketItems.clear();
    notifyListeners();
  }
}
