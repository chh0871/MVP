import 'package:cherry_mvp/core/utils/utils.dart';
import 'package:cherry_mvp/features/donation/models/donation_form_model.dart';
import 'package:cherry_mvp/features/donation/models/donation_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:cherry_mvp/features/donation/widgets/donation_options.dart';
import 'package:cherry_mvp/features/donation/widgets/donation_form_field.dart';
import 'package:cherry_mvp/features/donation/widgets/donation_dropdown_field.dart';
import 'package:cherry_mvp/features/donation/donation_viewmodel.dart';

class DonationForm extends StatefulWidget {
  const DonationForm({super.key});

  @override
  DonationFormState createState() => DonationFormState();
}

class DonationFormState extends State<DonationForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addToCollectionController =
      TextEditingController();

  String selectedCategory = '';
  String selectedPrice = '';
  String selectedCondition = '';

  bool isSwitchedOpenToOtherCharity = false;
  bool isSwitchedOpenToOffer = false;
  bool isSwitchedApplicableBuyerDiscounts = false;

  void toggleSwitchOpenToOtherCharity(bool value) {
    setState(() => isSwitchedOpenToOtherCharity = value);
  }

  void toggleSwitchOpenToOffer(bool value) {
    setState(() => isSwitchedOpenToOffer = value);
  }

  void toggleSwitchApplicableBuyerDiscounts(bool value) {
    setState(() => isSwitchedApplicableBuyerDiscounts = value);
  }

  DonationRequest buildDonationRequest() {
    return DonationRequest(
      title: _titleController.text,
      description: _descriptionController.text,
      category: selectedCategory,
      price: selectedPrice,
      condition: selectedCondition,
      collection: _addToCollectionController.text,
      openToOtherCharity: isSwitchedOpenToOtherCharity,
      openToOffer: isSwitchedOpenToOffer,
      applicableBuyerDiscounts: isSwitchedApplicableBuyerDiscounts,
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DonationViewModel>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          DonationFormField(
            controller: _titleController,
            hintText: titleHintText,
            title: titleText,
            hintIcon: Icons.add_circle,
          ),
          DonationFormField(
            controller: _descriptionController,
            hintText: descriptionHintText,
            title: descriptionText,
            hintIcon: Icons.add_circle,
            minLines: 3,
          ),
          DonationDropdownField(
            formFieldsHintText: categoryHintText,
            dropdownList: categoryDropdownList,
            onChanged: (val) => setState(() => selectedCategory = val!),
          ),
          DonationDropdownField(
            formFieldsHintText: priceHintText,
            dropdownList: priceDropdownList,
            onChanged: (val) => setState(() => selectedPrice = val!),
          ),
          DonationDropdownField(
            formFieldsHintText: conditionHintText,
            dropdownList: conditionDropdownList,
            onChanged: (val) => setState(() => selectedCondition = val!),
          ),
          DonationFormField(
            controller: _addToCollectionController,
            hintText: addToCollectionHintText,
            title: addToCollectionText,
            suffixIcon: Icons.add,
          ),
          DonationOptions(
            isSwitchedOpenToOtherCharity: isSwitchedOpenToOtherCharity,
            toggleSwitchOpenToOtherCharity: toggleSwitchOpenToOtherCharity,
            isSwitchedOpenToOffer: isSwitchedOpenToOffer,
            toggleSwitchOpenToOffer: toggleSwitchOpenToOffer,
            isSwitchedApplicableBuyerDiscounts:
                isSwitchedApplicableBuyerDiscounts,
            toggleSwitchApplicableBuyerDiscounts:
                toggleSwitchApplicableBuyerDiscounts,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: viewModel.status.type == StatusType.loading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (selectedCategory.isEmpty ||
                              selectedPrice.isEmpty ||
                              selectedCondition.isEmpty) {
                            Fluttertoast.showToast(
                                msg: 'Please select all dropdowns');
                            return;
                          }
                          final request = buildDonationRequest();
                          viewModel.submitDonation(request);
                        }
                      },
                      child: Text("Submit Donation"),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
