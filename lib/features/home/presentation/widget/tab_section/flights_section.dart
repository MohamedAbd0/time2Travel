import 'dart:developer';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/core/widgets/show_more.dart';
import 'package:time2Travel/features/flight/domain/domain.dart';
import 'package:time2Travel/features/flight/presentation/cubit/flight_cubit.dart';
import 'package:time2Travel/features/home/presentation/widget/one_way/one_way.dart';
import 'package:time2Travel/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FlightsTabSection extends StatefulWidget {
  const FlightsTabSection({super.key});

  @override
  State<FlightsTabSection> createState() => _FlightsTabSectionState();
}

class _FlightsTabSectionState extends State<FlightsTabSection> {
  bool isOneWay = true;
  bool isShowMore = false;
  String selectedClass = "Business";

  DateTime? departure;
  DateTime? returnDate;

  KeyPares? from;
  KeyPares? to;

  Travelers travelers = Travelers(adultCount: 1, childCount: 0, babyCount: 0);

  @override
  void dispose() {
    context.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FlightCubit, FlightState>(
      listener: (_, state) {
        log("FlightCubit : $state");
        if (state.searchState == RequestState.loading) {
          context.show();
        } else if (state.searchState == RequestState.loaded) {
          context.dismiss();
          context.pushNamed(Routes.flightsResults.name);
        } else if (state.searchState == RequestState.error) {
          context.dismiss();
          state.error.toString().toToastError(context);
        }
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDropdown(
                  selectedValue: selectedClass,
                  items: const ["First", "Business", "Economy", "Premium"],
                  onChanged: (value) {
                    setState(() => selectedClass = value);
                  },
                ),
                WayTypeSelection(
                  isOneWay: isOneWay,
                  onChanged: (value) {
                    setState(() {
                      isOneWay = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SelectPiker(
                  title: "Flying From",
                  hintText: "Dubai (DXB)",
                  icon: Icons.flight_takeoff,
                  onSelect: (value) {
                    setState(() => from = value);
                  },
                  items: [
                    KeyPares(name: "Dubai", id: "DXB"),
                    KeyPares(name: "Sharjah", id: "SHJ"),
                    KeyPares(name: "Cairo", id: "CAI"),
                  ],
                ),
              ),
              Expanded(
                child: SelectPiker(
                  title: "Flying to",
                  hintText: "Dubai (DXB)",
                  icon: Icons.flight_land,
                  onSelect: (value) {
                    setState(() => to = value);
                  },
                  items: [
                    KeyPares(name: "Dubai", id: "DXB"),
                    KeyPares(name: "Sharjah", id: "SHJ"),
                    KeyPares(name: "Cairo", id: "CAI"),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SelectDate(
                  title: "Departure",
                  hintText: "Select Date",
                  onSelect: (value) {
                    setState(() => departure = value);
                  },
                ),
              ),
              if (!isOneWay)
                Expanded(
                  child: SelectDate(
                    title: "Return",
                    hintText: "Select Date",
                    onSelect: (value) {
                      setState(() => returnDate = value);
                    },
                  ),
                ),
            ],
          ),
          if (isShowMore)
            Column(
              children: [
                SelectTravelers(
                  title: "Travelers",
                  initValue: travelers,
                  onSelect: (value) {
                    setState(() => travelers = value);
                  },
                ),
                Button(
                    title: "Search",
                    onPressed: () {
                      search(context);
                    }),
              ],
            ),
          ShowMoreWidget(
            isShowMore: isShowMore,
            onShowMore: (value) {
              setState(() {
                isShowMore = value;
              });
            },
          ),
        ],
      ),
    );
  }

  search(context) {
    if (from == null || to == null || departure == null) {
      "Select all required field".toToastError(context);
      return;
    }

    BlocProvider.of<FlightCubit>(context).flightSearch(
      FlightSearchParams(
        journeyType: isOneWay ? "OneWay" : "Return",
        airportOriginCode: from!.id,
        airportDestinationCode: to!.id,
        departureDate: departure!,
        returnDate: DateTime(2024, 2, 5),
        travelers: travelers,
        classType: selectedClass,
        directFlight: 0,
      ),
    );
  }
}
