import 'package:flutter/material.dart';  
import 'package:carousel_slider/carousel_slider.dart';

import 'package:cherry_mvp/core/config/config.dart'; 
import 'package:cherry_mvp/core/models/model.dart';  
import 'package:cherry_mvp/features/home/widgets/discover/category_product.dart';

class SingleCategory extends StatelessWidget {
  const SingleCategory({super.key, required this.product,});

  final DiscoverProduct product;  

  @override
  Widget build(BuildContext context) {  
    final screenWidth = MediaQuery.of(context).size.width; 
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, ), 
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
                    height:170, 
                    width: screenWidth,
                  ),
                ),
              ), 

              Positioned(
                bottom:10,
                left:10,

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(
                    product.charity_image, 
                    width: 40,
                    height: 40,  
                    fit: BoxFit.cover,
                  ),
                ) 
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
            product.charity_name, 
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
                  Container(
                    width : screenWidth - 16, 

                    child: Expanded(
                      child: Text(
                        product.description, 
                        style:TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.greyTextColor), 
                      ),
                    )
                  ),   
                   
                ]
              ),

               
            ]
          ), 
          
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
          ),
          
          // Items donated to charity
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ 
              Column(
                children: [
                  Row(
                    children: [
                      Text("Items donated to charity",
                        style: TextStyle(color:AppColors.black, fontSize:15, fontWeight: FontWeight.w700),
                      ),  
                    ]
                  ), 
                ]
              ),

              Column(
                children: [
                  Row(
                    children: [
                      Text("See All",
                        style: TextStyle(color:AppColors.greyTextColor, fontSize:12, fontWeight: FontWeight.w500),
                      ),  
                    ]
                  ), 
                ]
              ),
            ]
          ),

          Center(
            child: CarouselSlider(
              options: CarouselOptions( 
                height: MediaQuery.of(context).size.width * 0.4, // Adjust height
                autoPlay: true, // Enables auto-scrolling
                enlargeCenterPage: false, // Zooms the center item
                aspectRatio: 1, 
                viewportFraction: 0.33, // Controls visible portion of adjacent images
                initialPage: 0, // Ensure the first image is in view
                enableInfiniteScroll: true, // Prevent looping
              ),
              items: product.list_products.map((Item) {
                return Builder(
                  builder: (BuildContext context) {  
                    return SingleCategoryProduct(discoverItem: Item); 
                  },
                );
              }).toList(), 
            ),
          ),  
           
           
 
        ] 
      ),
    );
  }
}
