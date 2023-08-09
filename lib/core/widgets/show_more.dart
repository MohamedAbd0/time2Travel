import 'package:flutter/material.dart';

class ShowMoreWidget extends StatelessWidget {
  final ValueChanged<bool> onShowMore;
  final String? showMoreText;
  final String? showLessText;
  final bool isShowMore;
  const ShowMoreWidget({
    Key? key,
    required this.onShowMore,
    this.isShowMore = false,
    this.showMoreText = "Show More",
    this.showLessText = "Show Less",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextButton.icon(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          onShowMore(!isShowMore);
        },
        icon: Icon(
            isShowMore ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
        label: Text(isShowMore ? showLessText ?? '' : showMoreText ?? ''),
      ),
    );
  }
}
