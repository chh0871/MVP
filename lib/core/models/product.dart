import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final String id;
  final String name;
  final String description;
  final String quality;
  final List<String> product_images;
  @JsonKey(fromJson: _parseDouble)
  final double donation;
  @JsonKey(fromJson: _parseDouble)
  final double price;
  @JsonKey(defaultValue: '')
  final String charity_image;
  @JsonKey(fromJson: _parseInt)
  final int likes;
  @JsonKey(fromJson: _parseInt)
  final int number;
  final String size;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.quality,
    required this.product_images,
    required this.donation,
    required this.price,
    required this.charity_image,
    required this.likes,
    required this.number,
    required this.size,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Handle fallback for product_images vs images
    if (json['product_images'] == null && json['images'] != null) {
      json['product_images'] = json['images'];
    }
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  // Helper functions for JSON parsing
  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  static int _parseInt(`dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }
}