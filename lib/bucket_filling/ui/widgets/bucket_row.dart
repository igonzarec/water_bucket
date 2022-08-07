import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../bloc/decision_cubit.dart';
import '../../../shared/utils/assets.dart' as assets;

class BucketRow extends StatelessWidget {
  const BucketRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Bucket(update: context.read<DecisionCubit>().updateX),
        _Bucket(update: context.read<DecisionCubit>().updateY),
      ],
    );
  }
}

class _Bucket extends StatefulWidget {
  final Function(int) update;

  const _Bucket({Key? key, required this.update}) : super(key: key);

  @override
  State<_Bucket> createState() => _BucketState();
}

class _BucketState extends State<_Bucket> {
  var _gal = 1;

  _increment() {
    if (_gal == 999) {
      return;
    }
    setState(() {
      _gal++;
      widget.update(_gal);
    });
  }

  _decrement() {
    if (_gal == 1) {
      return;
    }
    setState(() {
      _gal--;
      widget.update(_gal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            assets.bucket,
            color: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 4),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    const Spacer(flex: 2),
                    Expanded(
                      flex: 2,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "$_gal gal",
                          style: TextStyle(
                              color: Colors.yellow.shade700,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Expanded(
                      flex: 10,
                      child: _buttonsRow(),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buttonsRow() {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: _increment,
            icon: const Icon(Icons.add_circle, color: Colors.blue),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: _decrement,
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
          ),
        ),
        const Spacer()
      ],
    );
  }
}
