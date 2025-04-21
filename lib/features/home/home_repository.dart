import 'package:cherry_mvp/core/models/model.dart';
import 'package:cherry_mvp/features/home/home_model.dart';

class HomeRepository {

  List<Category> fetchCategories()  {
    return dummyCategories;
  }

  List<Product> fetchProducts()  {
    return dummyProducts;
  }
}