/*
  Given a string 's'.
  
  We need to find the length of the longest substring such that:
  - The substring is continous (characters are next to each other).
  - All Characters inside the substring are unique (no repetition).

  We are not asked to return the substring itself, only the length of the longest valid substring.

  If the string is empty, the answer should be 0.

  Examples - 
  Input : "abcabcbb"
  Output : 3
  Explanation : The substring "abc" has all the unique characters and its length is 3, which is the maximum possible.

  Input : "bbbbbb"
  Output : 1
  Explanation : Any single character is unique, but repeating characters cannot form a longer valid substring. 
x*/

/*
  Approach
  
  We want to examine the string from left to right and keep track of a "window" of characters that always satisfies the condition: 
  -> all characters inside the window are unique.

  To do this: 

  - We maintain 2 pointers :
    a. left -> start of the current substring
    b. right -> end of the current substring
  
  - We also maintain a Set : 
    a. This Set stores characters currently present in our substring window.

  How the process works : 
  
  1. Start with both pointers at the beginning of the string
  2. Move the right pointer forward one character at a time.
  3. If the character at right is NOT in the Set:
    - Add it to the set
    - Update the maximum length using: 
    (right - left + 1)
  4. If the character is at right is already in the Set: 
    - This means the uniqueness rule is broken.
    - Move the left pointer forward.
    - Remove the characters from the set.
    - Continue until the duplicate character is removed.
  5. Repeat this process until the right reaches the end of the string.
    Why this works: 
    - The window always contain unique characters.
    - Each character is always added once and removed once.
    - This ensures an efficient linear traversal.
*/

import 'dart:math';

int longestUniqueSubstring(String input) {
  Set<String> seen = {};
  int left = 0;
  int maxLength = 0;
  for (int right = 0; right < input.length; right++) {
    while (seen.contains(input[right])) {
      seen.remove(input[left]);
      left++;
    }
    seen.add(input[right]);
    maxLength = max(maxLength, right - left + 1);
  }
  return maxLength;
}
