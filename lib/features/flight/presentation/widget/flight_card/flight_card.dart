// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/flight/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:time2Travel/features/flight/presentation/widget/widget.dart';

class FlightCard extends StatefulWidget {
  final Flight flight;
  const FlightCard({super.key, required this.flight});

  @override
  State<FlightCard> createState() => _FlightCardState();
}

class _FlightCardState extends State<FlightCard> {
  bool isShowDetails = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        shadowColor: Palette.primaryWithOpacity,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.smallCornerRadius),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 16, vertical: Dimens.space8),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const AirLineLogo(),
                title: Text(
                  widget.flight.originDestinationOptions?.first.tourSegments
                          ?.first.airlineName ??
                      "",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  "\$${widget.flight.fareTotal?.total?.amount.toString()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Palette.primary,
                  ),
                  textScaleFactor: 1.5,
                ),
              ),
              HorizentalTripTimeline(
                options: widget.flight.originDestinationOptions!.first,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Dimens.space8),
                child: const Divider(),
              ),
              !isShowDetails
                  ? Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        const TextTag(
                          text: "Economy Light",
                        ),
                        SpacerH(
                          value: Dimens.space4,
                        ),
                        const TextTag(
                          text: "1 x 20 kg",
                          icon: Icons.shopping_bag_outlined,
                        ),
                        SpacerH(
                          value: Dimens.space4,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              setState(() => isShowDetails = true);
                            },
                            icon: const Icon(Icons.keyboard_arrow_down),
                            label: const Text("Show Details"),
                          ),
                        ),
                      ],
                    )
                  : FlightDetails(
                      flight: widget.flight,
                      onCollapse: (value) {
                        setState(() => isShowDetails = value);
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
