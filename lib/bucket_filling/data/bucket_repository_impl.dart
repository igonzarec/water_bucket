import 'dart:math';

import '../domain/bucket_repository.dart';

class BucketRepositoryImpl implements BucketRepository {
  /// If successful, returns [List] of [List] of [int] which are the bucket
  /// states. If not successful, returns an empty [List].
  @override
  List<List<int>> pourIfPossible(
      int maxXGallons, int maxYGallons, int desiredGallons) {
    if (maxXGallons > maxYGallons) {
      int t = maxXGallons;
      maxXGallons = maxYGallons;
      maxYGallons = t;
    }

    if (desiredGallons > maxYGallons) {
      return [];
    }

    if (desiredGallons % maxXGallons.gcd(maxYGallons) != 0) {
      return [];
    }

    return _pourBuckets(maxXGallons, maxYGallons, desiredGallons);
  }

  List<List<int>> _pourBuckets(
      int maxXGallons, int maxYGallons, int desiredGallons) {
    int xBucketContent = maxXGallons;
    int yBucketContent = 0;

    List<List<int>> steps = [];
    void _updateSteps() => steps.add([xBucketContent, yBucketContent]);

    _updateSteps();

    while (
        xBucketContent != desiredGallons && yBucketContent != desiredGallons) {
      int pourableGallons = min(xBucketContent, maxYGallons - yBucketContent);

      xBucketContent = xBucketContent - pourableGallons;
      yBucketContent = yBucketContent + pourableGallons;

      _updateSteps();

      if (xBucketContent == desiredGallons ||
          yBucketContent == desiredGallons) {
        break;
      }

      if (xBucketContent == 0) {
        xBucketContent = maxXGallons;
        _updateSteps();
      }

      if (yBucketContent == maxYGallons) {
        yBucketContent = 0;
        _updateSteps();
      }
    }

    return steps;
  }
}
