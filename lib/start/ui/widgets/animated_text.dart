import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;

  const AnimatedText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
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

    animation = Tween<double>(begin: 25, end: 35).animate(controller);
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
        return Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: animation.value,
          ),
        );
      },
    );
  }
}
