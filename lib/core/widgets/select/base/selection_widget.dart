// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../resources/palette.dart';

class SelectionWidget extends StatelessWidget {
  final String title;
  final String? hintText;
  final String? value;
  final IconData? icon;
  final Function onTap;

  const SelectionWidget({
    Key? key,
    required this.title,
    this.hintText,
    required this.value,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textScaleFactor: 1.1,
          ),
          TextField(
            controller: TextEditingController(text: value),
            readOnly: true,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Palette.primaryWithOpacity,
                ),
              ),
              prefixIcon: icon == null
                  ? null
                  : Icon(
                      icon,
                      color: Palette.primary,
                    ),
            ),
            onTap: () {
              onTap();
            },
          )
        ],
      ),
    );
  }
}
