import 'package:time2Travel/core/core.dart';
import 'package:flutter/material.dart';
import 'base/one_way_widget.dart';

class WayTypeSelection extends StatelessWidget {
  final bool isOneWay;
  final ValueChanged<bool> onChanged;
  const WayTypeSelection(
      {super.key, required this.isOneWay, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OneWayWidget(
            isSelected: isOneWay,
            value: true,
            text: "One Way",
            onChanged: onChanged),
        const SpacerH(),
        OneWayWidget(
            isSelected: isOneWay == false,
            value: false,
            text: "Round Trip",
            onChanged: onChanged),
      ],
    );
  }
}
