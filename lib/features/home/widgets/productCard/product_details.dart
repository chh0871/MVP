import 'package:flutter/material.dart';  
import 'package:provider/provider.dart';  

import 'package:cherry_mvp/core/router/router.dart';  
import 'package:cherry_mvp/core/models/model.dart'; 
import 'package:cherry_mvp/core/config/config.dart';  


class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});  
 
  final NewProduct product;

  @override
  ProductDetailsState createState() => ProductDetailsState();
}

 

class ProductDetailsState extends State<ProductDetails> { 

  @override 
  Widget build(BuildContext context) {    
    final navigator = Provider.of<NavigationProvider>(context, listen: false);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    

    return SingleChildScrollView(   

      child: Column(
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
                    widget.product.product_image,      
                    fit: BoxFit.cover,
                    width: screenWidth,
                    height: screenHeight * 0.5,
                  ),
                ),
              ), 

              Positioned(
                bottom:10,
                right:10,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyFill, 
                    borderRadius: BorderRadius.circular(5.0),
                  ), 
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),

                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,   
                        size: 15,  
                        color: AppColors.primary            
                      ),

                      Text(
                        widget.product.likes.toString(), 
                        style:TextStyle(fontSize: 12, color: AppColors.primary), 
                      ), 
                    ]
                  )
                )
              ),

              Positioned(
                top:20,
                left:10,
                child: Container(  

                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.reply, 
                          color: AppColors.white,  
                        ),
                        onPressed: () {navigator.replaceWith(AppRoutes.home);},
                      ),  
                    ]
                  )
                )
              ),
            ]
          ), 

          // Item details (profile image, username, stars rate)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            AppImages.profileImg, 
                            width: 30,
                            height: 30,  
                            fit: BoxFit.cover,
                          ),
                        ), 

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ReemSteven", 
                              style:TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ), 

                            Row(
                              children: [
                                Icon(
                                  Icons.star_rate, 
                                  color: Colors.yellow,  
                                  size: 15,              
                                ),

                                Icon(
                                  Icons.star_rate, 
                                  color: Colors.yellow,  
                                  size: 15,              
                                ),

                                Icon(
                                  Icons.star_rate, 
                                  color: Colors.yellow,  
                                  size: 15,              
                                ),

                                Icon(
                                  Icons.star_rate, 
                                  color: Colors.yellow,  
                                  size: 15,              
                                ),

                                Icon(
                                  Icons.star_rate, 
                                  color: Colors.yellow,  
                                  size: 15,              
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: 2.0),
                                  child: Text(
                                    "(5)", 
                                    style:TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                  ),
                                ),

                                
                              ]
                            ),
                          ]
                        ),
                      ]
                    )
                  ]
                ),
 

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyFill, 
                    borderRadius: BorderRadius.circular(5.0), 
                  ), 
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                      widget.product.charity_image, 
                      width: 30,
                      height: 30,  
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white, 
                    border: Border.all(color: AppColors.greyTextColor, width: 1),
                    borderRadius: BorderRadius.circular(50.0), 
                  ), 
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),

                  child: Text(
                    "Ask seller",
                    style: TextStyle(color: AppColors.greyTextColor)
                  )
                ),

              ]
            )
          ),

          Divider(thickness:10, color: AppColors.lightGreyFill),
          
          // Item details (item name, price, included price, size)
          Container(   
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

            child: Column(  
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [ 
                Text(
                  widget.product.product_name, 
                  style:TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ), 

                Padding(padding: EdgeInsets.symmetric(vertical:2)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                          children: [
                            Text(
                              "£ ${widget.product.price.toStringAsFixed(2)}", 
                              style:TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),  

                            Padding(padding: EdgeInsets.only(left:10)),

                            Text(
                              "M", 
                              style:TextStyle(color: AppColors.greyTextColor, fontSize: 12, fontWeight: FontWeight.w600), 
                            ),   
                            
                            Padding(padding: EdgeInsets.only(left:7)),

                            Text(
                              widget.product.description, 
                              style:TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.greenBgColor), 
                            ), 
                          ]
                        ),
 
                        Row(
                          children: [ 
                            Text( 
                              "£ ${widget.product.included_price.toStringAsFixed(2)} Incl.",
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
                        Icon(
                          Icons.workspace_premium, 
                          color: AppColors.greyTextColor,  
                          size: 30,              
                        ),
                      ]
                    ),
                  ]
                ),

              ]
            )
          ), 


          Divider(thickness:10, color: AppColors.lightGreyFill),
          
          // Description
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description", 
                  style:TextStyle(fontWeight: FontWeight.w600, fontSize: 12), 
                ), 

                Text(
                  "Good condition, no label but 100% cotton.", 
                  style:TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: AppColors.greyTextColor), 
                ), 
              ]
            )
          ),


          Divider(thickness:10, color: AppColors.lightGreyFill),
          
          // Open to other charities
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration( 
                    gradient: LinearGradient( 
                      colors: [AppColors.white, AppColors.primary.withOpacity(0.1),],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(12.0), 
                  ), 
                  margin: EdgeInsets.symmetric(vertical: 3.0),
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                    children: [
                      Text(
                        "Open to other charities", 
                        style:TextStyle(fontWeight: FontWeight.w700, fontSize: 10, color: AppColors.greyTextColor), 
                      ), 

                      Text(
                        "Request other Charity", 
                        style:TextStyle(fontWeight: FontWeight.w700, fontSize: 10, color: AppColors.primary), 
                      ), 

                      Icon(
                        Icons.arrow_circle_right, 
                        color: AppColors.greyTextColor,  
                        size: 25,              
                      ),
                    ]
                  )
                ),
              ]
            )
          ),


          // Buyer Discount active
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration( 
                    gradient: LinearGradient( 
                      colors: [AppColors.white, AppColors.primary.withOpacity(0.1),],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(12.0), 
                  ), 
                  margin: EdgeInsets.symmetric(vertical: 3.0),
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                    children: [
                      Text(
                        "Buyer Discount active", 
                        style:TextStyle(fontWeight: FontWeight.w700, fontSize: 10, color: AppColors.greyTextColor), 
                      ), 

                      Text(
                        "Buy 2 get 1 half price", 
                        style:TextStyle(fontWeight: FontWeight.w700, fontSize: 10, color: AppColors.primary), 
                      ), 

                      Icon(
                        Icons.brightness_6, 
                        color: AppColors.primary,  
                        size: 25,              
                      ),
                    ]
                  )
                ),
              ]
            )
          ),


          // Button Make offer and Buy now
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              children: [
                Container(  

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                    children: [ 
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,  
                            foregroundColor: AppColors.greyTextColor,   // text color
                            side: BorderSide(color: AppColors.lightGreyFill, width: 1),  
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ), 

                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text('Make offer'),
                          )
                        ),
                      ), 

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.0), 
                      ),
                      
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,  
                            foregroundColor: AppColors.white,   // text color
                            side: BorderSide(color: AppColors.primary, width: 1),  
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ), 
                          
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Buy now',
                              style: TextStyle(fontWeight: FontWeight.w500)
                            ),
                          )
                        ),
                      ), 
 
                    ]
                  )
                ),
              ]
            )
          ), 

        ],  
      ),  
    ); 
  } 
}
