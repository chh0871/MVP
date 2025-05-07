import 'dart:io';

import 'package:flutter/material.dart';     
import 'package:provider/provider.dart'; 
   
import 'package:cherry_mvp/features/home/widgets/discover/category.dart';
import 'package:cherry_mvp/features/home/home_viewmodel.dart';    


class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});  

  @override
  DiscoverScreenState createState() => DiscoverScreenState();
}

 

class DiscoverScreenState extends State<DiscoverScreen> { 

  @override 
  Widget build(BuildContext context) {   
 
    return  Consumer<HomeViewModel>(
      builder: (context, viewModel, child) { 
        final products = viewModel.fetchDiscoverProducts(); 

        return Container( 

          child: Expanded(
            child: ListView.builder(
              itemCount: products.length,  
              itemBuilder: (context, index) {
                return SingleCategory(product: products[index]);  
              },
            ), 
          ), 
 
        ); 

      } 
    ); 

  } 
}
