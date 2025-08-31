
import 'package:json_annotation/json_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'donation_model.g.dart';

@JsonSerializable()
class DonationRequest {
  final String name;
  final String description;
  @JsonKey(name: 'categoryId')
  final String categoryId;
  @JsonKey(name: 'charityId')
  final String charityId;
  final String quality;
  final String size;
  @JsonKey(name: 'product_images')
  final List<String>? productImages;
  final double donation;
  final double price;
  final int likes;
  final int number;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final List<XFile>? localImages;

  DonationRequest({
    required this.name,
    required this.description,
    required this.categoryId,
    required this.charityId,
    required this.quality,
    required this.size,
    required this.donation,
    required this.price,
    this.productImages,
    this.likes = 0,
    this.number = 10,
    this.localImages,
  });

  factory DonationRequest.fromJson(Map<String, dynamic> json) =>
      _$DonationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DonationRequestToJson(this);

  DonationRequest copyWith({
    String? name,
    String? description,
    String? categoryId,
    String? charityId,
    String? quality,
    String? size,
    double? donation,
    double? price,
    List<String>? productImages,
    int? likes,
    int? number,
    List<XFile>? localImages,
  }) {
    return DonationRequest(
      name: name ?? this.name,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      charityId: charityId ?? this.charityId,
      quality: quality ?? this.quality,
      size: size ?? this.size,
      donation: donation ?? this.donation,
      price: price ?? this.price,
      productImages: productImages ?? this.productImages,
      likes: likes ?? this.likes,
      number: number ?? this.number,
      localImages: localImages ?? this.localImages,
    );
  }
}

@JsonSerializable()
class DonationResponse {
  final bool success;
  final String message;
  final DonationData data;

  DonationResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DonationResponse.fromJson(Map<String, dynamic> json) =>
      _$DonationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DonationResponseToJson(this);

  String get id => data.id;
  String get createdAt => data.createdAt;
}

@JsonSerializable()
class DonationData {
  final String id;
  final String name;
  final String description;
  final String categoryId;
  final String charityId;
  final String quality;
  final String size;
  @JsonKey(name: 'product_images')
  final List<String> productImages;
  final double donation;
  final double price;
  final int likes;
  final int number;
  final String userId;
  final String createdAt;
  final String updatedAt;

  DonationData({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.charityId,
    required this.quality,
    required this.size,
    required this.productImages,
    required this.donation,
    required this.price,
    required this.likes,
    required this.number,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DonationData.fromJson(Map<String, dynamic> json) =>
      _$DonationDataFromJson(json);

  Map<String, dynamic> toJson() => _$DonationDataToJson(this);
}
