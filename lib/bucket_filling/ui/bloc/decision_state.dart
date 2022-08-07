class DecisionState {
  final int xGallons;
  final int yGallons;
  final int zGallons;
  final List<List<int>> steps;

  DecisionState(
      {this.xGallons = 1,
      this.yGallons = 1,
      this.zGallons = 1,
      this.steps = const []});

  copyWith(
      {int? xGallons, int? yGallons, int? zGallons, List<List<int>>? steps}) {
    return DecisionState(
      xGallons: xGallons ?? this.xGallons,
      yGallons: yGallons ?? this.yGallons,
      zGallons: zGallons ?? this.zGallons,
      steps: steps ?? this.steps,
    );
  }
}
