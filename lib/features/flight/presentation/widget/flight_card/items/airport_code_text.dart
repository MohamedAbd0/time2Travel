import 'package:flutter/material.dart';

class AirportCodeText extends StatelessWidget {
  final String code;
  const AirportCodeText(this.code, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      code,
      textScaleFactor: 1.1,
      textAlign: TextAlign.center,
    );
  }
}
