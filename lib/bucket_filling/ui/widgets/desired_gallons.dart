import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/decision_cubit.dart';

class DesiredGallons extends StatefulWidget {
  const DesiredGallons({
    Key? key,
  }) : super(key: key);

  @override
  State<DesiredGallons> createState() => _DesiredGallonsState();
}

class _DesiredGallonsState extends State<DesiredGallons> {
  var _gal = 1;

  _increment() {
    if (_gal == 999) {
      return;
    }
    setState(() {
      _gal++;
      context.read<DecisionCubit>().updateZ(_gal);
    });
  }

  _decrement() {
    if (_gal == 1) {
      return;
    }
    setState(() {
      _gal--;
      context.read<DecisionCubit>().updateZ(_gal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: _increment,
          icon: const Icon(
            Icons.add_circle,
            color: Colors.white,
            size: 30,
          ),
        ),
        Text(
          '$_gal',
          style: const TextStyle(fontSize: 35, color: Colors.white),
        ),
        IconButton(
          onPressed: _decrement,
          icon: const Icon(
            Icons.remove_circle,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
