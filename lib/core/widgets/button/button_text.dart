import 'package:time2Travel/core/core.dart';
import 'package:flutter/material.dart';


class ButtonText extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;

  const ButtonText({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.color,
    this.titleColor,
    this.fontSize,
    this.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
              color: Palette.primary,
            ),
      ),
    );
  }
}
