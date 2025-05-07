import 'package:cherry_mvp/core/config/config.dart';
import 'package:cherry_mvp/core/models/model.dart';


const dummyProducts = [
  Product(name: "Men's Grey Button-up T-Shirt", quality: "8/Great", product_image: AppImages.mensTShirt, price: 7.00, charity_image: AppImages.homeStart, likes: 8, number: 8),
  Product(name: "Shoes", quality: "6/Good", product_image: AppImages.shoes2, price: 17.00, charity_image: AppImages.homeStart, likes: 33, number: 8)
];



const dummyNewProducts = [
  NewProduct(product_name: "Example product 1", product_image: AppImages.product1, description: "6/Very Good", likes: 3, price: 3.00, included_price: 3.30, charity_image: AppImages.logoSaveChildren),

  NewProduct(product_name: "Example product 2", product_image: AppImages.product2, description: "6/Very Good", likes: 4, price: 4.00, included_price: 4.30, charity_image: AppImages.logoAgeUk), 
  
  NewProduct(product_name: "Example product 3", product_image: AppImages.product3, description: "6/Very Good", likes: 5, price: 5.00, included_price: 5.30, charity_image: AppImages.logoBritishHeartFoundation), 
  
  NewProduct(product_name: "Example product 4", product_image: AppImages.product4, description: "6/Very Good", likes: 6, price: 6.00, included_price: 6.30, charity_image: AppImages.logoOneNation), 
  
  NewProduct(product_name: "Example product 5", product_image: AppImages.product5, description: "6/Very Good", likes: 7, price: 7.00, included_price: 7.30, charity_image: AppImages.logoRedCross), 
  
  NewProduct(product_name: "Example product 6", product_image: AppImages.product6, description: "6/Very Good", likes: 8, price: 8.00, included_price: 8.30, charity_image: AppImages.logoSaveChildren), 
]; 
 
const dummyDiscoverProducts = [
  DiscoverProduct(charity_name: "WaterAid", product_image: AppImages.discover_image1, description: "In a small village in Malawi, WaterAid recently completed the construction of a new well, providing clean, safe drinking water to hundreds of residents. No more long treks for water or unsafe sources—just fresh, life-giving hydration! Cheers to transforming lives, one drop at a time!", likes: 3, charity_image: AppImages.waterAid_logo, list_products: [DiscoverItem(item_image: AppImages.product1, likes: 3), DiscoverItem(item_image: AppImages.product2, likes: 5), DiscoverItem(item_image: AppImages.product3, likes: 8), DiscoverItem(item_image: AppImages.product4, likes: 9), DiscoverItem(item_image: AppImages.product5, likes: 6), DiscoverItem(item_image: AppImages.product6, likes: 7)]),
  

  DiscoverProduct(charity_name: "Cherry", product_image: AppImages.discover_image2, description: "Here in the UK, Shelter helped dozens of families move into secure housing last month. Thanks to their advocacy and support, families now have a place to call home, where they can build their futures. It's more than just bricks and mortar; it's a foundation for dreams.", likes: 3, charity_image: AppImages.cherry_logo, list_products: [DiscoverItem(item_image: AppImages.product1, likes: 3), DiscoverItem(item_image: AppImages.product2, likes: 5), DiscoverItem(item_image: AppImages.product3, likes: 8), DiscoverItem(item_image: AppImages.product4, likes: 9), DiscoverItem(item_image: AppImages.product5, likes: 6), DiscoverItem(item_image: AppImages.product6, likes: 7)]),
 
]; 