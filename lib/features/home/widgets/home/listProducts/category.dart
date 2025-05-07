import 'dart:io';
 
import 'package:flutter/material.dart';  

import 'package:cherry_mvp/core/config/config.dart'; 
import 'package:cherry_mvp/core/models/model.dart';  
import 'package:cherry_mvp/features/home/widgets/productCard/product_card.dart';

class SingleCategory extends StatelessWidget {
  const SingleCategory({super.key, required this.product,});

  final NewProduct product; 

  @override
  Widget build(BuildContext context) {  
    
    return InkWell(  
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductCard(product: NewProduct(product_name: product.product_name, product_image: product.product_image, description: product.description, likes: product.likes, price: product.price, included_price: product.included_price, charity_image: product.charity_image)),
          ),
        );
      }, 

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Card(
                color: AppColors.white,  
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: AppColors.white,  
                    width: 2,  
                  ),
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.product_image,     
                    fit: BoxFit.fill,
                  ),
                ),
              ), 

              Positioned(
                bottom:10,
                right:10,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white, 
                    borderRadius: BorderRadius.circular(5.0),
                  ), 
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),

                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,   
                        size: 15,              
                      ),

                      Text(
                        product.likes.toString(), 
                        style:TextStyle(fontSize: 12), 
                      ), 
                    ]
                  )
                )
              ),
            ]
          ), 

          Text(
            product.product_name, 
            style:TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ), 

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[ 

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.description, 
                        style:TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),

                      Padding(padding: EdgeInsets.only(left:5)),

                      Text(
                        "M", 
                        style:TextStyle(fontWeight: FontWeight.w900, fontSize: 12), 
                      ),
                    ]
                  ),  

                  Text( 
                    "£ ${product.price.toStringAsFixed(2)}",
                    style:TextStyle(fontSize:12, color: AppColors.greyTextColor, fontWeight: FontWeight.w700), 
                  ), 

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                  ),

                  Row(
                    children: [ 
                      Text( 
                        "£ ${product.included_price.toStringAsFixed(2)} Incl.",
                        style:TextStyle(color: AppColors.primary, fontSize:12, fontWeight: FontWeight.bold), 
                      ), 

                      Icon(
                        Icons.verified_user, 
                        color: AppColors.primary,  
                        size: 20,              
                      ),
                    ]
                  ), 
                ]
              ),

              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightGreyFill, 
                      borderRadius: BorderRadius.circular(5.0), 
                    ), 
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        product.charity_image, 
                        width: 30,
                        height: 30,  
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ]
              ),
            ]
          ), 
           
 
        ] 
      ),
    );
  }
}
