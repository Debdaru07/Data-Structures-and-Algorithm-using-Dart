import 'package:dsa_dart/arrays/binary_search.dart';
import 'package:test/test.dart';

void main() {
  group('Two Sum Tests', () {
    test('Basic Case', () {
      final result = twoSum([2, 7, 11, 15], 9);
      expect(result, [0, 1]);
    });

    test('Numbers in different order', () {
      final result = twoSum([3, 2, 4], 6);
      expect(result, [1, 2]);
    });

    test('Negative numbers', () {
      final result = twoSum([-1, -2, -3, -4, -5], -8);
      expect(result, [2, 4]);
    });
  });
}
