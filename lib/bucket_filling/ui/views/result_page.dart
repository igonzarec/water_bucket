import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/ui/widgets/back_button.dart';
import '../bloc/decision_cubit.dart';
import '../bloc/decision_state.dart';
import '../widgets/fillable_bucket.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);
  static TextStyle titleStyle = TextStyle(
      color: Colors.yellow.shade700, fontWeight: FontWeight.bold, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<DecisionCubit, DecisionState>(
            builder: (context, state) {
              if (state.steps.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Success!',
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.yellow.shade700,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Now you may continue your journey :)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, color: Colors.yellow.shade700),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => _showResults(context, state),
                        child: const Text(
                          'View steps',
                          style: TextStyle(fontSize: 25, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Oops!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.red.shade300,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Could not measure amount with your buckets :(',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, color: Colors.red.shade300),
                    ),
                  ],
                ),
              );
              // return Scaffold(body: Container(
              //   child: Text(state.steps.join("\n")),
              // ),);
            },
          ),
          const BackArrowButton(color: Colors.blue),
        ],
      ),
    );
  }

  Future<String?> _showResults(BuildContext context, DecisionState state) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Steps required',
              style: TextStyle(
                  color: Colors.blue.shade300,
                  fontWeight: FontWeight.w600,
                  fontSize: 30),
            ),
          ),
          content: SizedBox(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      "Step",
                      style: titleStyle.copyWith(fontSize: 16),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '${state.xGallons} gal Bucket',
                          style: titleStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text('${state.yGallons} gal Bucket',
                            style: titleStyle),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.yellow.shade700,
                  thickness: 2,
                ),
                Expanded(
                  child: _dialogContent(state),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _dialogContent(DecisionState state) {
    return Scrollbar(
      thumbVisibility: true,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: state.steps.length,
        itemBuilder: (context, index) {
          final steps = state.steps[index];

          return SizedBox(
            height: 80,
            child: Row(
              children: [
                Text(
                  "$index",
                  style: const TextStyle(color: Colors.grey),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 60,
                      child: Column(
                        children: [
                          Expanded(
                            child: FillableBucket(
                                current: steps[0], maxGallons: state.xGallons),
                          ),
                          Text(
                            "${steps[0]} gallons",
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: FillableBucket(
                            current: steps[1], maxGallons: state.yGallons),
                      ),
                      Text("${steps[1]} gallons",
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(thickness: 2);
        },
      ),
    );
  }
}
