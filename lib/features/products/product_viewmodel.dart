import 'package:cherry_mvp/core/models/model.dart';
import 'package:cherry_mvp/features/products/product_repository.dart';
import 'package:flutter/cupertino.dart';

class ProductViewModel extends ChangeNotifier {
  Product? _product;

  Product? get product => _product;

  final ProductRepository productRepository;

  ProductViewModel({required this.productRepository});

  void setProduct(Product product) {
    _product = product;
    notifyListeners();
  }
}
