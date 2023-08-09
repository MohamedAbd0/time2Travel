// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides
import 'package:time2Travel/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'custom_image_card.dart';

class PlaceCard extends CustomItemCard {
  final String name;
  final String imageUrl;
  final double price;
  final double rate;

  PlaceCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rate,
  }) : super(
          imageUrl: imageUrl,
          rate: rate,
          title: ListTile(
            title: Text(
              name,
              style: const TextStyle(
                color: Palette.white,
              ),
            ),
            subtitle: RichText(
              text: TextSpan(
                style: const TextStyle(color: Palette.white),
                children: [
                  TextSpan(
                    text: "\$$price",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const TextSpan(
                    text: " / Person",
                  ),
                ],
              ),
            ),
          ),
        );
}
