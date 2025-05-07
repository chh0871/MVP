import 'package:cherry_mvp/core/models/model.dart';

class DiscoverProduct {
  final String charity_name; 
  final String product_image;  
  final String description; 
  final int likes; 
  final String charity_image; 
  final List<DiscoverItem> list_products; 

  const DiscoverProduct(
      {required this.charity_name, required this.product_image, required this.description, required this.likes, required this.charity_image, required this.list_products});
}