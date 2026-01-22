import 'package:dsa_dart/strings/longest_unique_substring.dart';
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

  group('Longest Unique Substring Tests', () {
    test('Empty string', () {
      expect(longestUniqueSubstring(""), 0);
    });

    test('Single character', () {
      expect(longestUniqueSubstring("a"), 1);
    });

    test('All characters same', () {
      expect(longestUniqueSubstring("bbbb"), 1);
    });

    test('All characters unique', () {
      expect(longestUniqueSubstring("abcdef"), 6);
    });

    test('Repeating pattern', () {
      expect(longestUniqueSubstring("abcabcbb"), 3);
    });

    test('Mid-string longest window', () {
      expect(longestUniqueSubstring("pwwkew"), 3);
    });

    test('Overlapping duplicates', () {
      expect(longestUniqueSubstring("dvdf"), 3);
    });

    test('Spaces included as characters', () {
      expect(longestUniqueSubstring("a b c a"), 3);
    });

    test('Special characters', () {
      expect(longestUniqueSubstring("!@#!@"), 3);
    });

    test('Long realistic input', () {
      expect(
        longestUniqueSubstring("abcdeafghijaklmnop"),
        12,
      );
    });
  });
}
