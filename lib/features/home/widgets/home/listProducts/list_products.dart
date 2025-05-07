import 'dart:io';
 
import 'package:flutter/material.dart';     
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:auto_height_grid_view/auto_height_grid_view.dart';
 
import 'package:cherry_mvp/core/config/config.dart';
import 'package:cherry_mvp/core/utils/utils.dart';
import 'package:cherry_mvp/core/reusablewidgets/reusablewidgets.dart';  
import 'package:cherry_mvp/core/router/router.dart';
import 'package:cherry_mvp/features/home/widgets/home/listProducts/category.dart';
import 'package:cherry_mvp/features/home/home_viewmodel.dart';    


class ListProducts extends StatefulWidget {
  const ListProducts({super.key, required this.searchQuery,});  

  final String searchQuery; 

  @override
  ListProductsState createState() => ListProductsState();
}

 

class ListProductsState extends State<ListProducts> { 

  @override 
  Widget build(BuildContext context) {   
 
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) { 
        final products = viewModel.fetchNewProducts();
        final _products = products.where((product) {
          return product.product_name
            .toLowerCase()
            .contains(widget.searchQuery.toLowerCase()); 
          }).toList();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal:5.0),  

          child: Column(
            children: [ 
              SizedBox( 
                height: 10, 
              ),  
                    
              Center(
                child: Container( 
                  width: 600,   

                  child:AutoHeightGridView(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4, 

                    itemCount: _products.length,
                    shrinkWrap: true, // Ensures the GridView takes only necessary space
                    physics: const BouncingScrollPhysics(),

                    builder: (context, index) {
                      return SingleCategory(product: _products[index]);
                    }
                  ), 
                ),
              ), 
            ]
          ),
        );
      }
    );

  } 
}
