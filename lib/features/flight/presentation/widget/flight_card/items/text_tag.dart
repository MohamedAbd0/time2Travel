import 'package:time2Travel/core/core.dart';
import 'package:flutter/material.dart';

class TextTag extends StatelessWidget {
  final String text;
  final IconData? icon;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;

  const TextTag({
    Key? key,
    required this.text,
    this.icon,
    this.style,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 4,
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
        color: Palette.primaryLight,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                icon,
                size: 15,
              ),
            ),
          Text(
            text,
            style: style,
          ),
        ],
      ),
    );
  }
}
