import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_bucket/bucket_filling/ui/views/result_page.dart';
import 'package:water_bucket/bucket_filling/ui/widgets/animated_arrow.dart';
import '../../../shared/ui/widgets/back_button.dart';
import '../bloc/decision_cubit.dart';
import '../widgets/bucket_row.dart';
import '../widgets/desired_gallons.dart';

class DecisionPage extends StatelessWidget {
  const DecisionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue.shade300,
                  Colors.blue.shade100,
                  Colors.green.shade500,
                  Colors.green.shade400,
                ],
                stops: const [0.5, 0.67, 0.68, 0.70],
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: _buildDescription(),
                  ),
                ),
                const Expanded(
                  flex: 25,
                  child: BucketRow(),
                ),
                Expanded(
                  flex: 20,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Spacer(),
                        _buildTryButton(context),
                        const Spacer(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const BackArrowButton()
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Spacer(),
        Text(
          "You're on a journey. Ran out of water. You find a magic lake and can take as much water as desired. But to keep it you have to get the exact amount by using two buckets."
          ""
          "\nPlot twist: you can only know how much water a bucket contains if it's full. Emptying and refilling is allowed.",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
        SizedBox(height: 16),
        Text(
          "Set the gallons you'll take. Then set the bucket sizes.",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20),
        ),
        Expanded(child: DesiredGallons()),
      ],
    );
  }

  Widget _buildTryButton(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => const ResultPage()));
        context.read<DecisionCubit>().measure();
      },
      child: Row(
        children: const [
          Center(
            child: Text(
              'Try!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
          AnimatedArrow(),
        ],
      ),
    );
  }
}
