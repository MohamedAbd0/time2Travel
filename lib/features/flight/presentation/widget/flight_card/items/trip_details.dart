import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/flight/presentation/widget/widget.dart';
import 'package:time2Travel/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../../../domain/domain.dart';

class TripDetails extends StatelessWidget {
  final OriginDestinationOptions originDestinationOptions;
  const TripDetails({super.key, required this.originDestinationOptions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(
            Icons.calendar_month_outlined,
            color: Palette.primary,
            size: 35,
          ),
          title: Text(
            originDestinationOptions.tourSegments!.first.departureDateTime
                .toString()
                .toDateFormate()
                .toString(),
          ),
          subtitle: Text(originDestinationOptions
              .tourSegments!.first.departureDateTime
              .toString()
              .toDayFormate()
              .toString()),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SingleFlightTimeline(
              tourSegments: originDestinationOptions.tourSegments![index],
            );
          },
          separatorBuilder: (context, separatorIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TextTag(
                text:
                    "${DateTime.parse(originDestinationOptions.tourSegments![separatorIndex].arrivalDateTime!).difference(DateTime.parse(originDestinationOptions.tourSegments![separatorIndex + 1].departureDateTime!)).inMinutes.abs().toString().convertDurationToTime()} layover - ${originDestinationOptions.tourSegments![separatorIndex].arrivalAirportCode}",
                icon: Icons.access_time_outlined,
                padding: const EdgeInsets.all(10),
              ),
            );
          },
          itemCount: originDestinationOptions.tourSegments?.length ?? 0,
        ),
        ListTile(
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 8,
          minVerticalPadding: 0,
          leading: const Icon(
            Icons.location_on,
            color: Palette.primary,
            size: 35,
          ),
          title: Text(
            originDestinationOptions.tourSegments!.last.arrivalDateTime
                .toString()
                .toDateFormate()
                .toString(),
          ),
          subtitle: Text(originDestinationOptions
              .tourSegments!.last.arrivalDateTime
              .toString()
              .toDayFormate()
              .toString()),
        ),
        ListTile(
          horizontalTitleGap: 8,
          minVerticalPadding: 0,
          contentPadding: EdgeInsets.zero,
          dense: true,
          leading: const SizedBox(),
          title: const Text("Arrived at destination"),
          subtitle: Text(
            originDestinationOptions.tourSegments?.last.arrivalAirportCode ??
                "",
            textScaleFactor: 1.3,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        const Row(
          children: [
            TextTag(
              text: "Economy Light",
            ),
            SpacerH(),
            TextTag(
              text: "1 x 20 kg",
              icon: Icons.shopping_bag_outlined,
            ),
          ],
        ),
      ],
    );
  }
}
