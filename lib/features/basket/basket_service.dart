import 'package:cherry_mvp/core/models/product.dart';
import 'package:flutter/material.dart';

class BasketService extends ChangeNotifier {
  final List<Product> _basketItems = [];

  List<Product> get basketItems => List.unmodifiable(_basketItems);

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
