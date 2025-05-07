
import 'package:flutter/material.dart';  

import 'package:cherry_mvp/core/config/config.dart'; 
import 'package:cherry_mvp/core/models/model.dart';  

class SingleCategoryProduct extends StatelessWidget {
  const SingleCategoryProduct({super.key, required this.discoverItem,});

  final DiscoverItem discoverItem; 

  @override
  Widget build(BuildContext context) {  
    
    return InkWell(
      onTap: () {},
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
                    discoverItem.item_image,     
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
                        discoverItem.likes.toString(), 
                        style:TextStyle(fontSize: 12), 
                      ), 
                    ]
                  )
                )
              ),
            ]
          ),  
 
        ] 
      ),
    );
  }
}
