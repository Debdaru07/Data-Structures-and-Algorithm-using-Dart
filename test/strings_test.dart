import 'package:test/test.dart';
import '../lib/strings/first_non_repeating_char.dart';

void main() {
  group('firstNonRepeatingCharacter', () {
    test('returns index when first non-repeating character exists', () {
      expect(firstNonRepeatingCharacter("leetcode"), 0);
      expect(firstNonRepeatingCharacter("loveleetcode"), 2);
    });

    test('returns -1 when all characters repeat', () {
      expect(firstNonRepeatingCharacter("aabb"), -1);
      expect(firstNonRepeatingCharacter("ccdd"), -1);
    });

    test('handles single character string', () {
      expect(firstNonRepeatingCharacter("a"), 0);
    });

    test('handles empty string', () {
      expect(firstNonRepeatingCharacter(""), -1);
    });

    test('handles mixed characters', () {
      expect(firstNonRepeatingCharacter("aabbcdd"), 4);
      expect(firstNonRepeatingCharacter("abcabcde"), 6);
    });
  });
}
