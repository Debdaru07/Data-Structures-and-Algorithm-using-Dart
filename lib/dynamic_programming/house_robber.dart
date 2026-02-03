/* 
  PROBLEM: House Robber (Dynamic Programming)

  You are given an integer array 'nums' where: 
  - nums[i] represents the amount of money in the i-th house.

  You are a professional robber planning to rob houses along a street.

  CONSTRAINT: 
  - You cannot rob two adjacent houses.
  - If you rob house i, you cannot rob house i-1 or i+1.

  QUESTION: 
  What is the maximum amount of money you can rob without alerting the police ? 

  -----------------

  INPUT: 
  - A list of integers 'nums' where each value represents money in a house.

  OUTPUT: 
  - An integer representing the maximum money that can be robbed following the constraint.

  -----------------

  EXAMPLES: 

  Example 1: 
  Input: nums = [1, 2, 3, 1]
  Output: 4
  Explanation: 
  - Rob house 1 (1) and house 3 (3) -> total = 4

  Example 2: 
  Input: nums = [2, 7, 8, 3, 1]
  Output: 12
  Explanation: 
  - Rob house 2 (7) and house 4 (3) and house 5 (1) OR an optimal
    valid combination -> total = 12

  -----------------

  Important Observations (think before coding):

  1. At every house, you must make a decision: 
    - Rob this house 
    - Skip this house

  2. Robbing the current house affects the future choices because adjacent houses
    cannot be robbed.
  
  3. The optimal decision at the current house depends on optimal decisions made earlier.

  -----------------
  GOALs FOR Solution: 

  - Avoid brute-force recursion
  - Use Dynamic Programming
  - Optimize time and space if possible
  -----------------

  EXPECTED COMPLEXITY: 
  - Time: O(n)
  - Space: O(n) or O(1)
*/

/*
  APPROACH (Dynamic Programming): 

  1. Define dp[i] as the maximum amount of money that can be robbed 
    from the first i houses.

  2. At each house, there are two choices: 
    - Skip the current house: 
      money = dp[i-1]
    - Rob the current house: 
      money = dp[i-2] + nums[i]

  3. Choose the maximum of the two choices: 
    dp[i] = max(dp[i-1], dp[i-2] + nums[i])

  4. Base cases:
    - If there are no houses, return 0
    - If there is only one house, return its value

  5. Build the solution from left to right (bottom-up)
  6. Since only the last two states are required, optimize space to O(1).

  Time Complexity: O(n)
  Space Complexity: O(1)  
*/
import 'dart:math';

int rob(List<int> nums) {
  if (nums.length == 0) return 0;
  if (nums.length == 1) return nums[0];

  int prev = 0;
  int curr = 0;

  for (int money in nums) {
    int next = max(curr, prev + money);
    prev = curr;
    curr = next;
  }
  return curr;
}
