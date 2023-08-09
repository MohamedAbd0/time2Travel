import 'package:flutter/material.dart';

class LabelTimeLine extends StatelessWidget {
  final String boldText;
  final String normalText;
  const LabelTimeLine({
    Key? key,
    required this.boldText,
    required this.normalText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: boldText,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const TextSpan(
            text: " ",
          ),
          TextSpan(
            text: normalText,
          ),
        ],
      ),
    );
  }
}
