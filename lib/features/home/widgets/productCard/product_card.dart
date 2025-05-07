import 'package:flutter/material.dart';   
import 'package:provider/provider.dart'; 
 
import 'package:cherry_mvp/core/config/config.dart'; 
import 'package:cherry_mvp/core/models/model.dart';   
import 'package:cherry_mvp/features/home/widgets/productCard/product_details.dart';  
 

class ProductCard extends StatefulWidget { 
  const ProductCard({super.key, required this.product}); 

  final NewProduct product;
 

  @override
  ProductCardState createState() => ProductCardState();
}

 

class ProductCardState extends State<ProductCard> { 

  @override 
  Widget build(BuildContext context) { 

    return Scaffold( 
      backgroundColor: AppColors.white,   

      body: ProductDetails(product: widget.product), 
    ); 
  } 
}
