
class DonationRequest {
  final String title;
  final String description;
  final String category;
  final String price;
  final String condition;
  final String collection;
  final bool openToOtherCharity;
  final bool openToOffer;
  final bool applicableBuyerDiscounts;

  DonationRequest({
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.condition,
    required this.collection,
    required this.openToOtherCharity,
    required this.openToOffer,
    required this.applicableBuyerDiscounts,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'condition': condition,
      'collection': collection,
      'openToOtherCharity': openToOtherCharity,
      'openToOffer': openToOffer,
      'applicableBuyerDiscounts': applicableBuyerDiscounts,
    };
  }
}
