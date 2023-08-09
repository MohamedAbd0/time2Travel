import 'package:time2Travel/core/core.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Function onTap;
  const SectionTitle({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          )),
      trailing: TextButton(
        onPressed: () => onTap(),
        child: const Text(
          "View All",
          style: TextStyle(
            color: Palette.primary,
          ),
          textScaleFactor: 0.8,
        ),
      ),
    );
  }
}
