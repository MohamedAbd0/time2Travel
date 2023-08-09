import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/flight/presentation/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/domain.dart';

class FlightDetails extends StatefulWidget {
  final Flight flight;

  final ValueChanged<bool> onCollapse;
  const FlightDetails({
    Key? key,
    required this.onCollapse,
    required this.flight,
  }) : super(key: key);

  @override
  State<FlightDetails> createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails> {
  int tapIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.flight.originDestinationOptions?.length ?? 0,
      child: Column(
        children: [
          TabBar(
            labelColor: Palette.primary,
            onTap: (value) {
              setState(() {
                tapIndex = value;
              });
            },
            tabs: [
              ...widget.flight.originDestinationOptions
                      ?.map((e) => Tab(
                            text:
                                "${e.tourSegments?.first.departureAirportCode} - ${e.tourSegments?.last.arrivalAirportCode}",
                          ))
                      .toList() ??
                  [],
            ],
          ),
          TripDetails(
              originDestinationOptions:
                  widget.flight.originDestinationOptions![tapIndex]),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                title: "Select Flight",
                onPressed: () {
                  context.pushNamed(Routes.passengerInfo.name);
                },
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextButton.icon(
                  onPressed: () {
                    widget.onCollapse(false);
                  },
                  icon: const Icon(Icons.keyboard_arrow_up),
                  label: const Text("Hiden Details"),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
