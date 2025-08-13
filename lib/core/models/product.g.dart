// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      quality: json['quality'] as String,
      productImages: (json['productImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      donation: Product._parseDouble(json['donation']),
      price: Product._parseDouble(json['price']),
      charityImage: json['charityImage'] as String? ?? '',
      likes: Product._parseInt(json['likes']),
      number: Product._parseInt(json['number']),
      size: json['size'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'quality': instance.quality,
      'productImages': instance.productImages,
      'donation': instance.donation,
      'price': instance.price,
      'charityImage': instance.charityImage,
      'likes': instance.likes,
      'number': instance.number,
      'size': instance.size,
    };
