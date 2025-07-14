import 'package:flutter/material.dart';
import 'package:cherry_mvp/core/utils/utils.dart';

class DropdownFields extends StatefulWidget {
  const DropdownFields({
    super.key,
    required this.formFieldsHintText,
    required this.dropdownList,
    required this.onChanged,
  });

  final String formFieldsHintText;
  final List<String> dropdownList;
  final ValueChanged<String?> onChanged;

  @override
  DropdownFieldsState createState() => DropdownFieldsState();
}

class DropdownFieldsState extends State<DropdownFields> {
  String? selectedDropdownItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField<String>(
        value: selectedDropdownItem,
        items: widget.dropdownList.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        icon: const SizedBox.shrink(), // no default dropdown icon
        onChanged: (value) {
          setState(() => selectedDropdownItem = value);
          widget.onChanged(value); // <- notify parent
        },
        decoration: buildInputDecorationFormField(
          hintText: widget.formFieldsHintText,
          icon: null,
          iconSuffix: Icons.keyboard_arrow_down,
        ),
      ),
    );
  }
}
