import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/utils/assets.dart' as assets;

class FillableBucket extends StatelessWidget {
  const FillableBucket(
      {Key? key, required this.maxGallons, required this.current})
      : super(key: key);

  final int maxGallons;
  final int current;

  double get waterAmount => current / maxGallons;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
        colors: [Colors.blue, Colors.blue, Colors.grey.shade400],
        stops: [0.0, waterAmount, waterAmount],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: SvgPicture.asset(
        assets.bucket,
        color: Colors.white,
      ),
    );
  }
}
