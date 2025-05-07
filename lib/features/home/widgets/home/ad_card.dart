import 'dart:io';
 
import 'package:flutter/material.dart';    
import 'package:flutter/cupertino.dart'; 
import 'package:provider/provider.dart'; 
 
import 'package:cherry_mvp/core/config/config.dart';
import 'package:cherry_mvp/core/utils/utils.dart';
import 'package:cherry_mvp/core/reusablewidgets/reusablewidgets.dart';  
import 'package:cherry_mvp/core/router/router.dart';    


class AdCard extends StatelessWidget {
  const AdCard({super.key}); 

  @override 
  Widget build(BuildContext context) {   
    final screenWidth = MediaQuery.of(context).size.width;  
 
    return InkWell(
      onTap: () {},
      
      child: Container( 

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [ 
            Text(
              AppStrings.adText,
              style: TextStyle(fontWeight: FontWeight.w700)
            ),

            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              
              child: Image.asset(
                AppImages.ad_image, 
                width: screenWidth,  
                fit: BoxFit.cover,
              ),
            ),
            
          ]
        )
      )
    );

  } 
}
