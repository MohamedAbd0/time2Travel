import 'dart:ui';
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final Line line;
  final Paint? paintDef;

  const LinePainter({required this.line, this.paintDef});

  @override
  void paint(Canvas canvas, Size size) {
    if (paintDef == null || (paintDef?.strokeWidth ?? 0) < 0.0) return;

    double width = size.width;

    switch (line.runtimeType) {
      case SolidLine:
        {
          _drawSolidLine(canvas, width, paintDef!);
          break;
        }
      case DashedLine:
        {
          double dashSize = (line as DashedLine).dashSize ?? 8.0;
          if (dashSize <= 0) return;
          if (dashSize >= width) {
            return _drawSolidLine(canvas, width, paintDef!);
          }

          double gapSize = (line as DashedLine).gapSize ?? 4.0;
          if (gapSize >= width) return;
          if (gapSize <= 0) return _drawSolidLine(canvas, width, paintDef!);

          _drawDashedLine(canvas, width, paintDef!, dashSize, gapSize);
          break;
        }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void _drawSolidLine(Canvas canvas, double width, Paint paintDef) {
    double strokeVerticalOverflow = paintDef.strokeWidth / 2;
    double strokeHorizontalOverflow =
        paintDef.strokeCap == StrokeCap.butt ? 0.0 : strokeVerticalOverflow;

    canvas.drawLine(
      Offset(strokeHorizontalOverflow, strokeVerticalOverflow),
      Offset(width - strokeHorizontalOverflow, strokeVerticalOverflow),
      paintDef,
    );
  }

  void _drawDashedLine(
    Canvas canvas,
    double width,
    Paint paintDef,
    double dashSize,
    double gapSize,
  ) {
    double strokeVerticalOverflow = paintDef.strokeWidth / 2;

    double jointSize;
    double leapSize;
    late double firstDashSize;

    double position = 0.0;
    List<Offset> points = [];

    if (paintDef.strokeCap == StrokeCap.butt) {
      jointSize = dashSize + gapSize;
      leapSize = (width + gapSize) % jointSize;

      if (leapSize != 0) {
        if (gapSize > dashSize && gapSize - leapSize >= dashSize) {
          position = leapSize / 2;
        } else {
          firstDashSize = (dashSize - gapSize + leapSize) / 2;
        }
      }

      points.add(Offset(position, strokeVerticalOverflow));
      points.add(Offset(position += firstDashSize, strokeVerticalOverflow));
      position += gapSize;

      do {
        points.add(Offset(position, strokeVerticalOverflow));
        points.add(Offset(position + dashSize, strokeVerticalOverflow));
      } while ((position += jointSize) + dashSize <= width);

      points.add(Offset(width - firstDashSize, strokeVerticalOverflow));
      points.add(Offset(width, strokeVerticalOverflow));
    } else {
      dashSize += paintDef.strokeWidth;

      jointSize = dashSize + gapSize;
      leapSize = (width + gapSize) % jointSize;

      position = leapSize / 2;

      // position + pointSize <= width + pointSize
      do {
        points.add(Offset(position, strokeVerticalOverflow));
        points.add(Offset(position + dashSize, strokeVerticalOverflow));
      } while ((position += jointSize) + dashSize <= width);

      if (leapSize < paintDef.strokeWidth) {
        points.first = Offset(
          points.first.dx + strokeVerticalOverflow,
          points.first.dy,
        );
        points.last = Offset(
          points.last.dx - strokeVerticalOverflow,
          points.last.dy,
        );
      }
    }

    canvas.drawPoints(PointMode.lines, points, paintDef);
  }
}

abstract class Line {}

class SolidLine extends Line {}

class DashedLine extends Line {
  final double? dashSize;
  final double? gapSize;

  DashedLine({this.dashSize, this.gapSize});
}
