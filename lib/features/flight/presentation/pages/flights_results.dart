import 'dart:io';

import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/flight/presentation/cubit/flight_cubit.dart';
import 'package:time2Travel/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../widget/widget.dart';

class FlightsResultsPage extends StatelessWidget {
  const FlightsResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightCubit, FlightState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const SizedBox(),
            toolbarHeight: 120,
            flexibleSpace: Container(
              color: Palette.primary,
              child: Stack(
                children: [
                  Container(
                    color: Palette.primary,
                    child: Image.asset(
                      Images.appbarBackground,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Column(
                    children: [
                      SpacerV(
                        value: Platform.isAndroid
                            ? Dimens.space24
                            : Dimens.space40,
                      ),
                      ListTile(
                        leading: BackButton(
                          color: Palette.white,
                          onPressed: () {
                            context.back();
                          },
                        ),
                        title: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                state.flightSearchParams?.airportOriginCode ??
                                    '',
                                style: const TextStyle(
                                    color: Palette.white,
                                    fontWeight: FontWeight.bold),
                                textScaleFactor: 1.4,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimens.space8),
                                child: const Icon(
                                  Icons.swap_horiz,
                                  color: Palette.white,
                                ),
                              ),
                              Text(
                                state.flightSearchParams
                                        ?.airportDestinationCode ??
                                    '',
                                style: const TextStyle(
                                    color: Palette.white,
                                    fontWeight: FontWeight.bold),
                                textScaleFactor: 1.4,
                              ),
                            ],
                          ),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            context.back();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(blurRadius: 10, color: Palette.white)
                              ],
                            ),
                            child: CircleAvatar(
                                radius: 18,
                                backgroundColor:
                                    Palette.primary.withOpacity(0.9),
                                foregroundColor: Palette.white,
                                child: const Icon(
                                  Icons.edit,
                                )),
                          ),
                        ),
                      ),
                      Text(
                        state.flightSearchParams!.journeyType == "Return"
                            ? "${DateFormat.MMMEd().format(state.flightSearchParams!.departureDate)} - ${DateFormat.MMMEd().format(state.flightSearchParams!.returnDate!)}"
                            : DateFormat.MMMEd().format(
                                state.flightSearchParams!.departureDate),
                        style: const TextStyle(
                          color: Palette.white,
                        ),
                        textScaleFactor: 1.3,
                      ),
                      const SpacerV(),
                      Text(
                        state.flightSearchParams!.travelers.toString(),
                        style: const TextStyle(color: Palette.white),
                        textScaleFactor: 1.1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(Dimens.space8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "${state.flights.length} Flights",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                            text: " Avilable",
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      radius: 16,
                      backgroundColor: Palette.primary,
                      foregroundColor: Palette.white,
                      child: Icon(Icons.filter_list),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomDropdown(
                      selectedValue: "Cheap Price",
                      items: const ["Cheap Price", "High Price", "Low Price"],
                      onChanged: (value) {
                        //setState(()=>selectedClass = value);
                      },
                    ),
                    CustomDropdown(
                      selectedValue: "Stop Included",
                      items: const ["Stop Included"],
                      onChanged: (value) {
                        //setState(()=>selectedClass = value);
                      },
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: state.flights.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FlightCard(
                      flight: state.flights[index],
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
