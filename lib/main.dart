import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_bucket/start/ui/views/start_page.dart';

import 'bucket_filling/data/bucket_repository_impl.dart';
import 'bucket_filling/ui/bloc/decision_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DecisionCubit(BucketRepositoryImpl()),
      child: MaterialApp(
        title: 'The Bucket Challenge',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const StartPage(),
      ),
    );
  }
}
