import 'package:time2Travel/core/core.dart';
import 'package:flutter/material.dart';

import 'dashed_line.dart';

class AdvancedLine extends StatelessWidget {
  final Axis direction;
  final Line line;
  final Paint? paintDef;

  const AdvancedLine({
    super.key,
    this.direction = Axis.horizontal,
    required this.line,
    this.paintDef,
  });

  @override
  Widget build(BuildContext context) {
    Paint paint = paintDef ?? (Paint()..color = Palette.primary);

    Row lineWrapper = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: paint.strokeWidth,
            child: CustomPaint(
              painter: LinePainter(line: line, paintDef: paint),
            ),
          ),
        ),
      ],
    );

    if (direction == Axis.horizontal) {
      return lineWrapper;
    } else {
      return RotatedBox(
        quarterTurns: 1,
        child: lineWrapper,
      );
    }
  }
}
