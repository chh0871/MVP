class Product {
  final String id;
  final String name;
  final String description;
  final String quality;
  final List<String> productImages;
  final double donation;
  final double price;
  final String charityImage;
  final int likes;
  final int number;
  final String size;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.quality,
    required this.productImages, // updated here
    required this.donation,
    required this.price,
    required this.charityImage,
    required this.likes,
    required this.number,
    required this.size,
  });
}
