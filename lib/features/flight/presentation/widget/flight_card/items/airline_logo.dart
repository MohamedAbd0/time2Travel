import 'package:cached_network_image/cached_network_image.dart';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/utils/helper/constant.dart';
import 'package:flutter/material.dart';

class AirLineLogo extends StatelessWidget {
  final String? imageUrl;
  const AirLineLogo({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(blurRadius: 10, color: Palette.primary)],
      ),
      child: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
              imageUrl ?? Constants.get.airlineLogo)),
    );
  }
}
