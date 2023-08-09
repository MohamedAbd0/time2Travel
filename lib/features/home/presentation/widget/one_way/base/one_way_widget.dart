import 'package:time2Travel/core/core.dart';
import 'package:flutter/material.dart';

class OneWayWidget extends StatelessWidget {
  final bool isSelected;
  final ValueChanged<bool> onChanged;
  final String text;
  final bool value;

  const OneWayWidget(
      {super.key,
      required this.isSelected,
      required this.onChanged,
      required this.text,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Palette.primary : Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.cornerRadius),
            side: BorderSide(
              color: isSelected ? Palette.primary : Palette.gray,
            ),
          ),
          foregroundColor: isSelected ? Palette.white : Palette.gray,
        ),
        onPressed: () {
          onChanged(value);
        },
        child: Text(text));
  }
}
