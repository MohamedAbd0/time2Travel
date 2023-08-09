import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/core/widgets/show_more.dart';
import 'package:time2Travel/core/widgets/widgets.dart';
import 'package:time2Travel/features/home/presentation/widget/one_way/one_way.dart';
import 'package:flutter/material.dart';

class CarTabSection extends StatefulWidget {
  const CarTabSection({super.key});

  @override
  State<CarTabSection> createState() => _CarTabSectionState();
}

class _CarTabSectionState extends State<CarTabSection> {
  bool isOneWay = true;
  bool isShowMore = false;
  bool isDifferentReturn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: isOneWay
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              WayTypeSelection(
                isOneWay: isOneWay,
                onChanged: (value) {
                  setState(() {
                    isOneWay = value;
                  });
                },
              ),
              if (!isOneWay)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Switch(
                        value: isDifferentReturn,
                        onChanged: (value) {
                          setState(() => isDifferentReturn = value);
                        }),
                    const SpacerH(),
                    const Text(
                      "Different\nReturn",
                    )
                  ],
                )
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: SelectPiker(
                title: "Pickup Location",
                hintText: "Dubai (DXB)",
                icon: Icons.local_taxi_outlined,
                onSelect: (value) {},
                items: [
                  KeyPares(name: "Dubai", id: "DXB"),
                  KeyPares(name: "Sharjah", id: "SHJ"),
                  KeyPares(name: "Cairo", id: "CAI"),
                ],
              ),
            ),
            Expanded(
              child: SelectPiker(
                title: "Dropoff Location",
                hintText: "Dubai (DXB)",
                icon: Icons.local_taxi_outlined,
                onSelect: (value) {},
                items: [
                  KeyPares(name: "Dubai", id: "DXB"),
                  KeyPares(name: "Sharjah", id: "SHJ"),
                  KeyPares(name: "Cairo", id: "CAI"),
                ],
              ),
            ),
          ],
        ),
        if (isDifferentReturn)
          SelectPiker(
            title: "Final Destination",
            hintText: "Ras Al-Khaimah (RAK)",
            icon: Icons.local_taxi_outlined,
            onSelect: (value) {},
            items: [
              KeyPares(name: "Dubai", id: "DXB"),
              KeyPares(name: "Sharjah", id: "SHJ"),
              KeyPares(name: "Cairo", id: "CAI"),
            ],
          ),
        Row(
          children: [
            Expanded(
              child: SelectDate(
                title: "Departure",
                hintText: "Select Date",
                onSelect: (value) {},
              ),
            ),
            if (!isOneWay)
              Expanded(
                child: SelectDate(
                  title: "Return",
                  hintText: "Select Date",
                  onSelect: (value) {},
                ),
              ),
          ],
        ),
        if (isShowMore)
          Column(
            children: [
              Button(title: "Search", onPressed: () {}),
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
    );
  }
}
