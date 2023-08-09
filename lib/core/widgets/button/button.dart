import 'package:time2Travel/core/core.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;

  const Button({
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
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimens.space8,
      ),
      height: Dimens.buttonH,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: color ?? Palette.primary,
            padding: EdgeInsets.symmetric(horizontal: Dimens.space24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.cornerRadius),
            )),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Palette.white),
        ),
      ),
    );
  }
}
