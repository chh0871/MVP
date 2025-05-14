import 'package:flutter/material.dart';   

import 'package:cherry_mvp/core/config/config.dart';   

class SettingsItem extends StatelessWidget {
  const SettingsItem({super.key,});  

  @override
  Widget build(BuildContext context) {   
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 

        SizedBox( 
          height: 20, 
        ), 
 
        InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [ 

                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Text( 
                          "Profile",
                          style: TextStyle(color: AppColors.greyTextColor, fontWeight: FontWeight.w600,),
                        ),
                      ),
                    ]
                  ),
                ]
              ),

              Column(
                children: [  
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Text( 
                          "",
                          style: TextStyle(color: AppColors.greyTextColor, fontWeight: FontWeight.w600,),
                        ),
                      ),

                      Icon(
                        Icons.chevron_right,
                        color: AppColors.greyTextColor, 
                        size: 26,
                      ), 
                    ]
                  )
                ]
              ),
            ]
          ),
        ), 

        Divider(),  
      ]
    ); 
  }
}
