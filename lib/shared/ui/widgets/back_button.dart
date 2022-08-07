import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  final Color color;

  const BackArrowButton({Key? key, this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 24),
      child: BackButton(
        color: color,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
