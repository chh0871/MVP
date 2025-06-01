import 'package:flutter/material.dart';  
import 'package:cherry_mvp/core/config/config.dart';  
import 'package:cherry_mvp/features/donation/widgets/donation_options.dart'; 
import 'package:cherry_mvp/features/donation/widgets/form_fields.dart'; 
import 'package:cherry_mvp/features/donation/widgets/dropdown_fields.dart'; 


class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});  

  @override
  DonationScreenState createState() => DonationScreenState();
}

 

class DonationScreenState extends State<DonationScreen> {   
  bool isSwitchedOpenToOtherCharity = false;
  bool isSwitchedOpenToOffer = false;
  bool isSwitchedApplicableBuyerDiscounts = false;

  void toggleSwitchOpenToOtherCharity(bool value) {
    setState(() {
      isSwitchedOpenToOtherCharity = value; 
    });
  } 

  void toggleSwitchOpenToOffer(bool value) {
    setState(() {
      isSwitchedOpenToOffer = value; 
    });
  }

  void toggleSwitchApplicableBuyerDiscounts(bool value) {
    setState(() {
      isSwitchedApplicableBuyerDiscounts = value; 
    });
  } 

  
  final TextEditingController _titleController = TextEditingController(); 
  final String TitleHintText = 'e.g. White COS Jumper';
  final String TitleText = AppStrings.titleText;

  final TextEditingController _descriptionController = TextEditingController(); 
  final String DescriptionHintText = "e.g. only worn a few times, brand x, true to size, no label.";
  final String DescriptionText = AppStrings.descriptionText;

  final TextEditingController _addToCollectionController = TextEditingController(); 
  final String AddToCollectionHintText = "Add to Collection";
  final String AddToCollectionText = "";


  final String CategoryHintText = AppStrings.categoryText;
  final List<String> CategoryDropdownList = ['Category A', 'Category B', 'Category C', 'Category D'];

  final String CharityHintText = AppStrings.charityText;
  final List<String> CharityDropdownList = ['Charity A', 'Charity B', 'Charity C', 'Charity D'];

  final String PriceHintText = AppStrings.priceText;
  final List<String> PriceDropdownList = ["£10.0", "£20.99", "£30.99", "£15.99"];

  final String ConditionHintText = AppStrings.conditionText;
  final List<String> ConditionDropdownList = ["Condition A", "Condition B", "Condition C", "Condition D"];




  @override 
  Widget build(BuildContext context) {   
    final _formKey = GlobalKey<FormState>();

    return Scaffold( 
      backgroundColor: AppColors.white,  
      body: SingleChildScrollView( 
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                FormFields(formFieldsController: _titleController, formFieldsHintText: TitleHintText, formFieldsTitle: TitleText, icon: Icons.add_circle, iconSuffix: null),

                FormFields(formFieldsController: _descriptionController, formFieldsHintText: DescriptionHintText, formFieldsTitle: DescriptionText, icon: Icons.add_circle, iconSuffix: null),

                DropdownFields(formFieldsHintText: CategoryHintText, dropdownList: CategoryDropdownList), 

                DropdownFields(formFieldsHintText: PriceHintText, dropdownList: PriceDropdownList),  

                DropdownFields(formFieldsHintText: ConditionHintText, dropdownList: ConditionDropdownList), 

                FormFields(formFieldsController: _addToCollectionController, formFieldsHintText: AddToCollectionHintText, formFieldsTitle: AddToCollectionText, icon: null, iconSuffix: Icons.add), 

                DonationOptions(isSwitchedOpenToOtherCharity: isSwitchedOpenToOtherCharity, toggleSwitchOpenToOtherCharity: toggleSwitchOpenToOtherCharity, isSwitchedOpenToOffer: isSwitchedOpenToOffer, toggleSwitchOpenToOffer: toggleSwitchOpenToOffer, isSwitchedApplicableBuyerDiscounts: isSwitchedApplicableBuyerDiscounts, toggleSwitchApplicableBuyerDiscounts: toggleSwitchApplicableBuyerDiscounts),
              ]
            )
          )
        ) 
      )
    ); 
  } 
}
