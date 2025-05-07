class NewProduct {
  final String product_name; 
  final String product_image; 
  final String description; 
  final int likes;
  final double price;
  final double included_price; 
  final String charity_image;  

  const NewProduct(
      {required this.product_name, required this.product_image, required this.description, required this.likes, required this.price, required this.included_price, required this.charity_image});
}