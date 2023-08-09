import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/flight/presentation/widget/widget.dart';
import 'package:time2Travel/utils/utils.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../../domain/entities/entities.dart';

class HorizentalTripTimeline extends StatelessWidget {
  final OriginDestinationOptions options;
  const HorizentalTripTimeline({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AirportCodeText(
                options.tourSegments!.first.departureAirportCode.toString()),
            const AirportCodeText(
              " ",
            ),
            AirportCodeText(
                options.tourSegments!.last.arrivalAirportCode.toString()),
          ],
        ),
        Row(
          children: [
            const SpacerH(),
            const Icon(
              Icons.radio_button_checked,
              size: 16,
              color: Palette.primary,
            ),
            Expanded(
              child: AdvancedLine(
                line: DashedLine(),
              ),
            ),
            Transform.rotate(
              angle: math.pi / 2,
              child: const Icon(
                Icons.flight,
                color: Palette.primary,
              ),
            ),
            Expanded(
              child: AdvancedLine(
                line: DashedLine(),
              ),
            ),
            const Icon(
              Icons.radio_button_checked,
              size: 16,
              color: Palette.primary,
            ),
            const SpacerH(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(options.tourSegments!.first.departureDateTime
                .toString()
                .formateDateToTime()),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.access_time_outlined,
                  size: 16,
                  color: Palette.primary,
                ),
                SpacerH(
                  value: Dimens.space2,
                ),
                Text(
                    "${DateTime.parse(options.tourSegments!.first.departureDateTime!).difference(DateTime.parse(options.tourSegments!.last.arrivalDateTime!)).inMinutes.abs().toString().convertDurationToTime()} "),
              ],
            ),
            Text(options.tourSegments!.last.arrivalDateTime
                .toString()
                .formateDateToTime()),
          ],
        ),
      ],
    );
  }
}
