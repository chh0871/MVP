import 'dart:io';
 
import 'package:flutter/material.dart';    
import 'package:flutter/cupertino.dart'; 
import 'package:provider/provider.dart'; 
  
import 'package:cherry_mvp/core/config/config.dart';
import 'package:cherry_mvp/core/utils/utils.dart';
import 'package:cherry_mvp/core/reusablewidgets/reusablewidgets.dart';  
import 'package:cherry_mvp/core/router/router.dart';    


class ExploreCard extends StatelessWidget {
  const ExploreCard({super.key}); 

  @override 
  Widget build(BuildContext context) {   
    final navigator = Provider.of<NavigationProvider>(context, listen: false);
 
    return InkWell(
      onTap: () {navigator.replaceWith(AppRoutes.discover); },
      
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary, 
          borderRadius: BorderRadius.circular(12.0),
        ), 
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  width:90,
                  child: Expanded(
                    child: Text(
                      AppStrings.exploreText,
                      style:TextStyle(color: AppColors.white, fontWeight: FontWeight.w700, fontSize: 20, height: 1.0), 
                    )
                  )
                ),

                Container(
                  width:100,
                  child: Expanded(
                    child: Text(
                      AppStrings.discover_something_Text,
                      style:TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: 10, height: 1.0),
                      overflow: TextOverflow.ellipsis,
                      maxLines:2,
                    )
                  )
                ),
              ]
            ),

            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    AppImages.explore_image, 
                    width: 80,
                    height: 80,  
                    fit: BoxFit.cover,
                  ),
                ),
              ]
            ),
          ]
        )
      )
    );

  } 
}
