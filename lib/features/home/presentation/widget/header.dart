import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  final ValueChanged<int> onTapChange;
  const HomeHeaderWidget({super.key, required this.onTapChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.2,
      child: Stack(
        children: [
          Container(
            color: Palette.primary,
            child: Image.asset(
              Images.appbarBackground,
              fit: BoxFit.fill,
              width: context.width,
              height: context.height * 0.2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text.rich(TextSpan(
                    style: TextStyle(color: Palette.white),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Where’s Your',
                        style: TextStyle(fontSize: 22),
                      ),
                      TextSpan(
                        text: '\nNext Destination?',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )
                    ])),
                Container(
                  decoration: const BoxDecoration(
                      color: Palette.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                  child: TabBar(
                    labelColor: Palette.primary,
                    unselectedLabelColor: Colors.grey,
                    onTap: onTapChange,
                    tabs: [
                      Tab(
                        child: Row(
                          children: [
                            const Icon(Icons.flight),
                            SpacerH(
                              value: Dimens.space4,
                            ),
                            const Text("Flights"),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            const Icon(Icons.home_work_outlined),
                            SpacerH(
                              value: Dimens.space4,
                            ),
                            const Text("Hotels"),
                          ],
                        ),
                      ),
                      Tab(
                        child: Row(
                          children: [
                            const Icon(Icons.local_taxi),
                            SpacerH(
                              value: Dimens.space4,
                            ),
                            const Text("Cars"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
