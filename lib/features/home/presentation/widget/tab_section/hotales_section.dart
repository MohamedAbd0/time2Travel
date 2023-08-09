import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/core/widgets/show_more.dart';
import 'package:time2Travel/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HotelsTabSection extends StatefulWidget {
  const HotelsTabSection({super.key});

  @override
  State<HotelsTabSection> createState() => _HotelsTabSectionState();
}

class _HotelsTabSectionState extends State<HotelsTabSection> {
  bool isShowMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectPiker(
          title: "Where are you going?",
          hintText: "Select City",
          icon: Icons.location_on,
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
                title: "Check In",
                hintText: "Select Date",
                onSelect: (value) {},
              ),
            ),
            Expanded(
              child: SelectDate(
                title: "Check Out",
                hintText: "Select Date",
                onSelect: (value) {},
              ),
            ),
          ],
        ),
        if (isShowMore)
          Column(
            children: [
              SelectTravelers(
                title: "Guests",
                initValue:
                    Travelers(adultCount: 1, childCount: 0, babyCount: 0),
                onSelect: (value) {},
              ),
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
