import 'package:cherry_mvp/core/config/config.dart';
import 'package:cherry_mvp/core/models/model.dart';

const dummyProducts = [
  Product(
    id: "1",
    name: "Men's Grey Button-up T-Shirt",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    quality: "8/Great",
    size: "M",
    productImages: [
      AppImages.mensTShirt,
      AppImages.mensTShirt, // You can add more images or different ones
    ],
    donation: 6.40,
    price: 7.00,
    charityImage: AppImages.homeStart,
    likes: 8,
    number: 8,
  ),
  Product(
    id: "2",
    name: "Shoes",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    quality: "6/Good",
    size: "8",
    productImages: [
      AppImages.shoes2,
      AppImages.shoes2,
    ],
    donation: 16.00,
    price: 17.00,
    charityImage: AppImages.homeStart,
    likes: 33,
    number: 8,
  ),
  Product(
    id: "3",
    name: "Shoes",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    quality: "6/Good",
    size: "8",
    productImages: [
      AppImages.shoes2,
    ],
    donation: 17.00,
    price: 17.00,
    charityImage: AppImages.homeStart,
    likes: 33,
    number: 9,
  ),
  Product(
    id: "4",
    name: "Shoes",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    quality: "6/Good",
    size: "8",
    productImages: [
      AppImages.shoes2,
    ],
    donation: 17.00,
    price: 17.00,
    charityImage: AppImages.homeStart,
    likes: 33,
    number: 9,
  )
];
