/*
Problem:
Given a string s, find the index of the first non-repeating character in it.
If no such character exists, return -1.

Examples:
Input: "leetcode"
Output: 0

Input: "loveleetcode"
Output: 2

Input: "aabb"
Output: -1

*/

/* Approach

  1. We cannot decide if a character is non-repeating until we know how many times each character appears in the String.
  2. First pass - 
    - Traverse the string and store the frequency of each character using a HashMap (character -> count).

  3. Second pass - 
    - Traverse the string again in the original order.
    - The first character whose frequency is exactly 1 is the required answer.

  4. If no character with frequency 1 is found, return -1

  Time Complexity :
  - O(n), where n is the length of the string

  Space Complexity : 
  - O(1), since the number of possible characters is limited. 

*/

int firstNonRepeatingCharacter(String s) {
  Map<String, int> freq = {};

  // First Passing
  for (int i = 0; i < s.length; i++) {
    freq[s[i]] = (freq[s[i]] ?? 0) + 1;
  }

  // Second Passing
  for (int i = 0; i < s.length; i++) {
    if (freq[s[i]] == 1) {
      return i;
    }
  }
  return -1;
}
