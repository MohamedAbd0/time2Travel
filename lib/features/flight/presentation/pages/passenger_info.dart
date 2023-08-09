import 'package:cached_network_image/cached_network_image.dart';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/flight/presentation/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/domain.dart';
import '../cubit/cubit.dart';

class PassengerInfoPage extends StatefulWidget {
  const PassengerInfoPage({super.key});
  @override
  State<PassengerInfoPage> createState() => _PassengerInfoPageState();
}

class _PassengerInfoPageState extends State<PassengerInfoPage> {
  List<PassengerInfo> passengerInfoAdultList = [];
  List<PassengerInfo> passengerInfoChildList = [];
  List<PassengerInfo> passengerInfoInfantList = [];

  @override
  void initState() {
    super.initState();
    final travelers =
        context.read<FlightCubit>().state.flightSearchParams?.travelers;
    passengerInfoAdultList =
        List.generate(travelers?.adultCount ?? 0, (index) => PassengerInfo());
    passengerInfoChildList =
        List.generate(travelers?.childCount ?? 0, (index) => PassengerInfo());
    passengerInfoInfantList =
        List.generate(travelers?.babyCount ?? 0, (index) => PassengerInfo());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        title: const Text("Your Flight Booking"),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.space8),
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Palette.white,
              child: CircleAvatar(
                radius: 18,
                backgroundImage: CachedNetworkImageProvider(
                    "https://www.powertrafic.fr/wp-content/uploads/2023/04/image-ia-exemple.png"),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              children: [
                StepWidget(
                  icon: Icons.group,
                  title: "Customize",
                  status: StepStatus.done,
                ),
                Expanded(
                    child: Divider(
                  color: Palette.primary,
                  thickness: 1,
                )),
                StepWidget(
                  icon: Icons.group,
                  title: "Passenger info",
                  status: StepStatus.current,
                ),
                Expanded(
                    child: Divider(
                  color: Palette.primary,
                  thickness: 1,
                )),
                StepWidget(
                  icon: Icons.group,
                  title: "Payment",
                  status: StepStatus.undone,
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: passengerInfoAdultList.length,
              itemBuilder: (context, index) => TravelerInfoCard(
                title:
                    "Traveler ${index + 1}: Adult ${index == 0 ? '(Lead)' : ''}",
                onPassengerInfoChanged: (value) {
                  setState(() => passengerInfoAdultList[index] = value);
                },
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: passengerInfoChildList.length,
              itemBuilder: (context, index) => TravelerInfoCard(
                title:
                    "Traveler ${index + 1 + passengerInfoAdultList.length}: Child",
                onPassengerInfoChanged: (value) {
                  setState(() => passengerInfoChildList[index] = value);
                },
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: passengerInfoInfantList.length,
              itemBuilder: (context, index) => TravelerInfoCard(
                title:
                    "Traveler ${index + 1 + passengerInfoAdultList.length + passengerInfoChildList.length}: Infant",
                onPassengerInfoChanged: (value) {
                  setState(() => passengerInfoInfantList[index] = value);
                },
              ),
            ),
            Button(title: "Next", onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class StepWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final StepStatus status;
  const StepWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: status == StepStatus.done
                  ? Palette.primary
                  : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: status == StepStatus.undone
                    ? Palette.gray
                    : Palette.primary,
                // width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: status == StepStatus.current
                  ? Palette.primary
                  : status == StepStatus.done
                      ? Palette.white
                      : Palette.gray,
              size: 30,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Dimens.space8),
          child: Text(
            title,
            style: TextStyle(
              color: status == StepStatus.undone ? Palette.gray : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

enum StepStatus {
  current,
  done,
  undone,
}
