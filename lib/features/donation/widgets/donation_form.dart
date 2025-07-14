import 'package:cherry_mvp/core/utils/utils.dart';
import 'package:cherry_mvp/features/donation/models/donation_form_model.dart';
import 'package:cherry_mvp/features/donation/models/donation_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:cherry_mvp/features/donation/widgets/donation_options.dart';
import 'package:cherry_mvp/features/donation/widgets/donation_form_fields.dart';
import 'package:cherry_mvp/features/donation/widgets/donation_dropdown_fields.dart';
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
          DonationFormFields(
            formFieldsController: _titleController,
            formFieldsHintText: TitleHintText,
            formFieldsTitle: TitleText,
            icon: Icons.add_circle,
            iconSuffix: null,
          ),
          DonationFormFields(
            formFieldsController: _descriptionController,
            formFieldsHintText: DescriptionHintText,
            formFieldsTitle: DescriptionText,
            icon: Icons.add_circle,
            iconSuffix: null,
          ),
          DropdownFields(
            formFieldsHintText: CategoryHintText,
            dropdownList: CategoryDropdownList,
            onChanged: (val) => setState(() => selectedCategory = val!),
          ),
          DropdownFields(
            formFieldsHintText: PriceHintText,
            dropdownList: PriceDropdownList,
            onChanged: (val) => setState(() => selectedPrice = val!),
          ),
          DropdownFields(
            formFieldsHintText: ConditionHintText,
            dropdownList: ConditionDropdownList,
            onChanged: (val) => setState(() => selectedCondition = val!),
          ),
          DonationFormFields(
            formFieldsController: _addToCollectionController,
            formFieldsHintText: AddToCollectionHintText,
            formFieldsTitle: AddToCollectionText,
            icon: null,
            iconSuffix: Icons.add,
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
          const SizedBox(height: 20),
          viewModel.status.type == StatusType.loading
              ? const Center(child: CircularProgressIndicator())
              : FilledButton(
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
