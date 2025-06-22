import 'package:flutter/material.dart'; 
import 'package:cherry_mvp/core/config/config.dart';
import 'package:cherry_mvp/core/utils/utils.dart';
import 'package:cherry_mvp/core/reusablewidgets/reusablewidgets.dart'; 

class DonationFormFields extends StatefulWidget {
  const DonationFormFields({
    super.key,  
    required this.formFieldsController, 
    required this.formFieldsHintText, 
    required this.formFieldsTitle,
    required this.icon,
    required this.iconSuffix
  });

  final TextEditingController formFieldsController;
  final String formFieldsHintText;
  final String formFieldsTitle;
  final IconData? icon;
  final IconData? iconSuffix;

  @override
  FormFieldsState createState() => FormFieldsState();
}

class FormFieldsState extends State<DonationFormFields> {
  
  bool formFieldsIsEmpty = true;

  void formFieldsCheckEmptiness(value) {
    setState(() {
      if (value.isEmpty) {
        formFieldsIsEmpty = true;
      } else {
        formFieldsIsEmpty = false;
      }
    }); 
  }

  @override
  Widget build(BuildContext context) { 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
        
        if (widget.formFieldsTitle != "") 
        Text(
          widget.formFieldsTitle,
          style: TextStyle(color:AppColors.greyTextColor, fontWeight: FontWeight.w600,),
        ),

        // Form TextField  
        Padding(
          padding: EdgeInsets.only(bottom:10),
          child: TextFormField(
            maxLines: null,
            controller: widget.formFieldsController,
            validator: validateDonationFormFields,
            onChanged: formFieldsCheckEmptiness,
            decoration: buildInputDecorationFormField(hintText: widget.formFieldsHintText, icon: formFieldsIsEmpty ? widget.icon : null, iconSuffix: widget.iconSuffix),
          )
        ),
  
      ], 
       
    );
  }
}
