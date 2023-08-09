import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/utils/utils.dart';
import 'package:flutter/material.dart';

class LoaingNewMessageWidget extends StatelessWidget {
  const LoaingNewMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.width * 0.40;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SpacerV(),
        CustomOpacityAnimation(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.smallCornerRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: LoadingBox(
                width: width,
                checkColor: Palette.primary,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              LoadingBox(
                width: width,
              ),
              const SpacerV(),
              LoadingBox(
                width: width,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomOpacityAnimation extends StatefulWidget {
  final Widget child;
  const CustomOpacityAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<CustomOpacityAnimation> createState() => _CustomOpacityAnimationState();
}

class _CustomOpacityAnimationState extends State<CustomOpacityAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 500),
    );
    _animation = Tween<double>(begin: 1, end: 0).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: widget.child,
        );
      },
    );
  }
}

class LoadingBox extends StatelessWidget {
  final double width;
  final Color checkColor;
  const LoadingBox(
      {super.key, required this.width, this.checkColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: checkColor,
          foregroundColor: Palette.white,
          child: const Icon(
            Icons.done_rounded,
          ),
        ),
        const SpacerV(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LineWithGradient(width: width),
            LineWithGradient(width: width * 0.75),
            LineWithGradient(width: width * 0.4),
          ],
        ),
      ],
    );
  }
}

class LineWithGradient extends StatelessWidget {
  final double width;
  const LineWithGradient({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: width,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        gradient: LinearGradient(
          colors: [
            Colors.grey[400]!,
            Colors.grey[200]!,
          ],
          stops: const [0.0, 1.0],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
        ),
      ),
    );
  }
}
