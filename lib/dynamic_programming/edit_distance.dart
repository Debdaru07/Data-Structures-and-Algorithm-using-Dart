/* 
  Edit Distance Problem (Levenshtein Distance)

  You are given two strings:
  - word1
  - word2

  Task: 
  Find the minimum number of operations required to convert 'word 1' into 'word 2'.

  Allowed Seperations:
  1. Insert a character
  2. Delete a character
  3. Replace a character
  
  Each operation counts as one step.

  Example 1: 
  word1 = 'horse'
  word2 = 'ros'

  Explanation:
  horse -> rorse (replace 'h' with 'r')
  rorse -> rose (delete 'r')
  rose -> ros (delete 'e')
  Output = 3

  Example 2: 
  word1 = 'intention'
  word2 = 'execution'

  output = 5

  Constraints:
  - 0 <= word1.length, word2.length <= 500
  - word1 and word2 consist of lowercase English letters

  Goal: 
  Return the minimum number of operations required to convert word1 into word2
*/

/* 
  Approach to solve the distance problem

  Observation: 
  - We are converting word1 into word2
  - At each step, we can: 
    1. Insert a character
    2. Delete a character
    3. Replace a character
  - We need the minimum number of operations.

  Key Idea:
  - Compare the strings character by character
  - If character matches, no operation is required
  - If they don't match, try all 3 operations and take the minimum

  Dynamic Programming Insight: 
  - The problem can be broken into smaller subproblems:
    converting prefixes of word1 into prefixes of word2.
  - Same subproblems repeat -> DP is required.

  Step-1: Define DP State
  - Let dp[i][j] represent the minimum number of operations required to convert.
    word[0..i-1] -> word2[0..j-1]

  Step-2: Base cases
  - dp[0][0] = 0
    (empty string to empty string needs 0 operations)

  - dp[i][0] = i
    (convert first i characters of word1 to emtpy string -> delete all i characters)
  
  - dp[0][j] = j
    (convert empty string to first j characters of word2 -> insert all j characters)
  
  Step-3: State transition
  For each i from 1 to word1.length:
    For each j from 1 to word2.length:
    
    Case 1: Characters Match
    - If word1[i-1] == word2[j-1]:
        dp[i][j] = dp[i-1][j-1]
        (no operation needed)
    
    Case 2: Characters do not match
    - Try all 3 operations: 

    1. Insert:
       dp[i][j-1] + 1
       (insert word2[j-1] into word1)

    2. Delete:
       dp[i-1][j] + 1
       (replace the word1[i-1] with word2[j-1])

    3. Replace: 
       dp[i-1][j-1] + 1
       (replace word1[i-1] with word2[j-1])
    
    - Take the minimum of the above three.
  
  Step 4: Final answer
  - dp[word1.length][word2.length] is the result.

  Why this works:
  - Every edit reduces the problem size.
  - Optimal solution depends on optimal sub-problems
  - DP ensures no recomputation

  Time Complexity: 
  - O(n * m)
  where n = length of word1, m = length of word2

  Space Complexity: 
  - O(n * m)
*/
