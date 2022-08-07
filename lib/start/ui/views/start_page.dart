import 'package:flutter/material.dart';
import 'package:water_bucket/bucket_filling/ui/views/decision_page.dart';
import '../../../shared/ui/fade_transition_route.dart';
import '../widgets/animated_text.dart';
import '../../../shared/utils/assets.dart' as assets;

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(FadeTransitionRoute(const DecisionPage()));
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade300,
                Colors.white,
              ],
              stops: const [0.5, 0.7],
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      children: const [
                        Text(
                          'The Bucket\nChallenge',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 50),
                        ),
                        Text(
                          'And The Unlimited Lake',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const AnimatedText(text: 'Tap to start'),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    assets.lake,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
