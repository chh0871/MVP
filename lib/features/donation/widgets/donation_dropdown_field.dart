import 'package:flutter/material.dart';

class DonationDropdownField extends StatefulWidget {
  const DonationDropdownField({
    super.key,
    required this.formFieldsHintText,
    required this.dropdownList,
    required this.onChanged,
  });

  final String formFieldsHintText;
  final List<String> dropdownList;
  final ValueChanged<String?> onChanged;

  @override
  DonationDropdownFieldState createState() => DonationDropdownFieldState();
}

class DonationDropdownFieldState extends State<DonationDropdownField> {
  String? selectedDropdownItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: DropdownButtonFormField<String>(
        value: selectedDropdownItem,
        items: widget.dropdownList.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (value) {
          setState(() => selectedDropdownItem = value);
          widget.onChanged(value); // <- notify parent
        },
        decoration: InputDecoration(hintText: widget.formFieldsHintText),
      ),
    );
  }
}
