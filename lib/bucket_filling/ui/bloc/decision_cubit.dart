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
    final steps = _repository.pourIfPossible(
        state.xGallons, state.yGallons, state.zGallons);

    emit(state.copyWith(steps: List.of(steps)));
  }
}
