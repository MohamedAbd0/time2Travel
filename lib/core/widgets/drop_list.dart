import 'package:time2Travel/core/core.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String selectedValue;
  final List<String> items;
  final ValueChanged<String> onChanged;
  const CustomDropdown(
      {super.key,
      required this.selectedValue,
      required this.onChanged,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.space12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.smallCornerRadius),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<String>(
        isDense: true,
        borderRadius: BorderRadius.circular(8),
        underline: Container(),
        value: items.contains(selectedValue) ? selectedValue : items.first,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.toString(),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          onChanged(newValue ?? selectedValue);
        },
      ),
    );
  }
}
