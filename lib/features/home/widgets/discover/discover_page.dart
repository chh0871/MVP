import 'package:flutter/material.dart';  
import 'package:provider/provider.dart'; 
 
import 'package:cherry_mvp/core/config/config.dart'; 
import 'package:cherry_mvp/core/router/router.dart';  
import 'package:cherry_mvp/features/home/widgets/discover/discover_screen.dart';  


class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});  

  @override
  DiscoverPageState createState() => DiscoverPageState();
}

 

class DiscoverPageState extends State<DiscoverPage> { 
  int _selectedIndex = 0; 


  final List<Widget> _pages = [
    DiscoverScreen(),
 

    Center(
      child: Column(
        children : [
          SizedBox(height:200),

          Text("Smaller Charities"), 
        ]
      )
    ),  

    Center(
      child: Column(
        children : [
          SizedBox(height:200),

          Text("Local to you"), 
        ]
      )
    ), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } 

  Widget _buildTextButton(int index, String label) {
    return Container( 
      decoration: BoxDecoration(
        color: _selectedIndex == index ? AppColors.white : AppColors.lightGreyFill,
        borderRadius: BorderRadius.circular(_selectedIndex == index ? 5.0 : 50),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),

      child: Expanded(
        child: InkWell(
          onTap: () => _onItemTapped(index),
          child: Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? AppColors.primary : AppColors.greyTextColor, fontWeight: FontWeight.bold, fontSize: 10,
            ),
          ),
        )
      )
    );
  }
 


  @override 
  Widget build(BuildContext context) {   
    final navigator = Provider.of<NavigationProvider>(context, listen: false);
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold( 
      backgroundColor: AppColors.white,  

      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: Icon(
            Icons.reply, 
            color: AppColors.primary,  
          ),
          onPressed: () {navigator.replaceWith(AppRoutes.home);},
        ),  

        title: Text(
          AppStrings.discoverText,
          style: TextStyle(fontSize:15, color: AppColors.black, fontWeight: FontWeight.bold,),
        ),
 
        centerTitle: true,   
        
      ), 

      body: Column(
        children: <Widget>[ 
          Container( 
            decoration: BoxDecoration(
              color: AppColors.lightGreyFill, 
              borderRadius: BorderRadius.circular(5.0), 
            ),   
            padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
            margin: EdgeInsets.symmetric(horizontal: 15),

            child: Row(  
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                _buildTextButton(0, AppStrings.popularText),
                _buildTextButton(1, AppStrings.smaller_charities_Text),
                _buildTextButton(2, AppStrings.local_to_you_Text),
              ]
            )
          ), 
 

          _pages[_selectedIndex]

        ],  
      ),  
    ); 
  } 
}
