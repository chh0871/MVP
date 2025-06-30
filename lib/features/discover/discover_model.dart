import 'package:cherry_mvp/core/config/app_images.dart';
import 'package:cherry_mvp/core/models/charity_category.dart';
import 'package:cherry_mvp/core/config/config.dart';
import 'package:cherry_mvp/core/models/model.dart';

final List<Charity> dummyCharities = [
  Charity(
    charityName: "WaterAid",
    description:
    "In a small village in Malawi, WaterAid recently completed the construction of a new well, providing clean, safe drinking water to hundreds of residents. No more long treks for water. No more toxic sources!",
    charityImage: AppImages.discover_image1,
    charityLogo: AppImages.waterAid_logo,
    likes: 3,
  ),
];

const dummyProducts = [
  Product(
    id: "1",
    name: "Men's Grey Button-up T-Shirt",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    quality: "8/Great",
    size: "M",
    product_images: [
      AppImages.mensTShirt,
      AppImages.mensTShirt,  // You can add more images or different ones
    ],
    donation: 6.40,
    price: 7.00,
    charity_image: AppImages.homeStart,
    likes: 8,
    number: 8,
  ),
  Product(
    id: "2",
    name: "Shoes",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    quality: "6/Good",
    size: "8",
    product_images: [
      AppImages.shoes2,
      AppImages.shoes2,
    ],
    donation: 16.00,
    price: 17.00,
    charity_image: AppImages.homeStart,
    likes: 33,
    number: 8,
  ),
  Product(
    id: "3",
    name: "Shoes",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    quality: "6/Good",
    size: "8",
    product_images: [
      AppImages.shoes2,
    ],
    donation: 17.00,
    price: 17.00,
    charity_image: AppImages.homeStart,
    likes: 33,
    number: 9,
  ),
  Product(
    id: "4",
    name: "Shoes",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    quality: "6/Good",
    size: "8",
    product_images: [
      AppImages.shoes2,
    ],
    donation: 17.00,
    price: 17.00,
    charity_image: AppImages.homeStart,
    likes: 33,
    number: 9,
  )
];

