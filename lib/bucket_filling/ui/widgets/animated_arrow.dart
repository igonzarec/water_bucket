import 'package:flutter/material.dart';

class AnimatedArrow extends StatefulWidget {
  const AnimatedArrow({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedArrow> createState() => _AnimatedArrowState();
}

class _AnimatedArrowState extends State<AnimatedArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat(reverse: true);
        }
      });

    animation = Tween<double>(begin: 40, end: 50).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Icon(
          Icons.arrow_forward_ios_sharp,
          color: Colors.white,
          size: animation.value,
        );
      },
    );
  }
}
