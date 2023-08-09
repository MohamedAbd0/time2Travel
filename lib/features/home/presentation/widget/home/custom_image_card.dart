// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:time2Travel/core/core.dart';
import 'package:flutter/material.dart';

class CustomItemCard extends StatelessWidget {
  final String imageUrl;
  final double rate;
  final Widget title;
  final Widget? subTitle;
  const CustomItemCard({
    Key? key,
    required this.imageUrl,
    required this.rate,
    required this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 150,
          height: 200,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  icon: const Icon(Icons.favorite_border, color: Palette.white),
                  onPressed: () {},
                ),
              ),
              Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    margin: EdgeInsets.all(Dimens.space8),
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimens.space8, vertical: Dimens.space4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black26),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                        SpacerH(
                          value: Dimens.space2,
                        ),
                        Text(
                          "$rate",
                          style: const TextStyle(color: Palette.white),
                        )
                      ],
                    ),
                  )),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black87,
                          Colors.black.withOpacity(0),
                        ],
                        stops: const [0.0, 1.0],
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.topCenter,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: title,
                ),
              )
            ],
          ),
        ),
        if (subTitle != null) subTitle!
      ],
    );
  }
}
