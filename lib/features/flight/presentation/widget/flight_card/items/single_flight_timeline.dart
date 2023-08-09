import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/flight/presentation/widget/widget.dart';
import 'package:time2Travel/utils/utils.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../../domain/domain.dart';

class SingleFlightTimeline extends StatelessWidget {
  final TourSegments tourSegments;
  const SingleFlightTimeline({super.key, required this.tourSegments});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AirLineLogo(),
        const SpacerH(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelTimeLine(
                boldText: tourSegments.departureDateTime
                    .toString()
                    .formateDateToTime(),
                normalText: tourSegments.departureAirportCode.toString(),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const SpacerV(),
                      const Icon(
                        Icons.radio_button_checked,
                        size: 16,
                        color: Palette.primary,
                      ),
                      SizedBox(
                        height: 40,
                        child: AdvancedLine(
                          direction: Axis.vertical,
                          line: DashedLine(),
                        ),
                      ),
                      Transform.rotate(
                        angle: math.pi,
                        child: const Icon(
                          Icons.flight,
                          color: Palette.primary,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: AdvancedLine(
                          direction: Axis.vertical,
                          line: DashedLine(),
                        ),
                      ),
                      const Icon(
                        Icons.radio_button_checked,
                        size: 16,
                        color: Palette.primary,
                      ),
                      const SpacerV(),
                    ],
                  ),
                  const SpacerH(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tourSegments.airlineName.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            const TextSpan(
                              text: "Travel time:",
                            ),
                            const TextSpan(
                              text: " ",
                            ),
                            TextSpan(
                              text: tourSegments.journeyDuration
                                  .toString()
                                  .convertDurationToTime(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Palette.primary),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              LabelTimeLine(
                boldText:
                    tourSegments.arrivalDateTime.toString().formateDateToTime(),
                normalText: tourSegments.arrivalAirportCode.toString(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
