import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/bucket_repository.dart';
import 'decision_state.dart';

class DecisionCubit extends Cubit<DecisionState> {
  final BucketRepository _repository;

  DecisionCubit(this._repository) : super(DecisionState());

  void updateX(int gallons) {
    emit(state.copyWith(xGallons: gallons));
  }

  void updateY(int gallons) {
    emit(state.copyWith(yGallons: gallons));
  }

  void updateZ(int gallons) {
    emit(state.copyWith(zGallons: gallons));
  }

  void measure() {
    // Obtain steps
    final steps = _repository.pourIfPossible(
        state.xGallons, state.yGallons, state.zGallons);

    // Organize gallons for ui
    var xGallons = state.xGallons;
    var yGallons = state.yGallons;

    if (xGallons > yGallons) {
      int t = xGallons;
      xGallons = yGallons;
      yGallons = t;
    }

    emit(state.copyWith(
      steps: List.of(steps),
      xGallons: xGallons,
      yGallons: yGallons,
    ));
  }
}
