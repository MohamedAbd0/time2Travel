import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../flight/presentation/widget/widget.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.smallCornerRadius),
          border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.smallCornerRadius),
              child: Image.asset(
                Images.offerImage,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Get 50% off on your first flight booking"),
                  subtitle: Text("Use code FIRST50"),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Code"),
                        SpacerH(),
                        TextTag(
                          text: "XASDW",
                          style: TextStyle(
                            color: Palette.primary,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton.icon(
                            onPressed: () {},
                            icon: Transform.flip(
                              flipX: true,
                              child: const Icon(Icons.reply),
                            ),
                            label: Text(
                              "Share",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.normal),
                              textScaleFactor: 0.8,
                            )),

                        //book now
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimens.space8,
                              vertical: Dimens.space4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Dimens.smallCornerRadius),
                              color: Palette.primary,
                            ),
                            child: const Text(
                              "Book Now",
                              style: TextStyle(
                                color: Palette.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
