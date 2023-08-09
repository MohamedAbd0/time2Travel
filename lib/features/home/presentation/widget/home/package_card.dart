// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides
import 'package:time2Travel/core/core.dart';
import 'package:flutter/material.dart';

import 'custom_image_card.dart';

class PackageCard extends CustomItemCard {
  final String name;
  final String imageUrl;
  final String price;
  final double rate;
  final String location;
  final String date;
  final int peopleCount;

  PackageCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rate,
    required this.location,
    required this.date,
    required this.peopleCount,
  }) : super(
            imageUrl: imageUrl,
            rate: rate,
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      border: Border.all(color: Palette.white)),
                  child: Text(
                    "\$$price",
                    style: const TextStyle(color: Palette.white),
                  ),
                ),
              ],
            ),
            subTitle: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SpacerV(),
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(0.4),
                      1: FlexColumnWidth(0.6),
                    },
                    children: [
                      TableRow(children: [
                        Table(
                          columnWidths: const {
                            0: FlexColumnWidth(0.25),
                            1: FlexColumnWidth(0.75),
                          },
                          children: [
                            TableRow(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  size: 15,
                                  color: Palette.primary,
                                ),
                                Text(date,
                                    style: const TextStyle(
                                      fontSize: 11,
                                    )),
                              ],
                            )
                          ],
                        ),

                        ///

                        Table(
                          columnWidths: const {
                            0: FlexColumnWidth(0.25),
                            1: FlexColumnWidth(0.75),
                          },
                          children: [
                            TableRow(
                              children: [
                                const Icon(
                                  Icons.group,
                                  size: 15,
                                  color: Palette.primary,
                                ),
                                Text("People: $peopleCount",
                                    style: const TextStyle(
                                      fontSize: 11,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ])
                    ],
                  )
                ],
              ),
            ));
}
