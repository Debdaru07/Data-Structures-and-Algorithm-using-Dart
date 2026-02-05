/* 
  Coin Change Problem

  You are given: 
  1. An array of integers 'coins', where each element represents 
    the denomination
  2. An integer 'amount', representing a target sum.

  Task: 
  Determine the minimum number of coins needed to make up the given amonut.

  Rules: 
  - You can each coin denomination an unlimited number of times.
  - If it is not possible to make the exact 'amount' using the given
    coin, return -1.

  Example 1:
  coins = [1, 2, 5], amount = 11

  Explanation:
  11 can be formed as 5 + 5 + 1
  Minimum coins required = 3

  Example 2:
  coins = [2], amount = 3
  
  Explanation:
  It is not possible to form 3 using only coin 2
  
  Output = -1

  Example 3:
  coins = [1], amount = 0
  Explanation: 
  No coins are needed to make amount 0
  Output = 0

  Constraints:

  - 1 <= coins.length <= 12
  - 1 <= coins[i] <= 10^4
  - 0 <= amount <= 10^4

  Goal:
  Return the minimum number of coins required to form 'amount'
  or -1 if it cannot be formed.
*/

/* 
  Approach to solve Coin Change Problem

  Observation:
  - We need the Minimum number of coins to form a given amount.
  - Each coin can be used unlimited times.
  - Order of coins does NOT matter.

  Key Idea:
  - If we know the minimum coins needed for smaller amounts, 
    we can build the answer for larger amounts.
  - This hints towards Dynamic Programming.

  Step 1: Define the DP state
  - Let dp[i] represent the minimum number of coins required to make amount = i.
  
  Step 2: Initialize DP Array
  - Create an array dp of size [amount + 1].
  - Set dp[0] = 0
    Reason: 
    - 0 coins are needed to make amount 0.

  - Initialization all other dp[i] with a large value (representing an impossible state initially)

  Step 3: Build the solution bottom-up
  - For every amount i from 1 to amount: 
    - Try every coin in the coins array.
    - If coin <= i:
      - Check if usng this coin reduces the number of coins:
        dp[i] = min(dp[i], dp[i - coin] + 1)

  Explanation: x
  - dp[i - coin] tells us how many coins were needed to form the remaining amount.
  - Adding the current coin increases the count by 1.

  Step 4: Final Answer
  - If dp[amount] is still a large value, it means the amount cannot be formed -> return -1.
  - Otherwise, return dp[amount].

  Why this works: 
  - We try all possible ways to form each element.
  - We always keep the minimum coin count.
  - Overlapping subproblems are reused via dp.

  Time Complexity:
  - O(amount * number_of_coins)

  Space Complexity: 
  - O(amount)
*/

int coinChange(List<int> coins, int amount) {
  if (amount == 0) return 0;

  List<int> dp = List.filled(amount + 1, amount + 1);
  dp[0] = 0;
  for (int i = 1; i <= amount; i++) {
    for (int coin in coins) {
      if (coin <= i) {
        dp[i] = dp[i] < dp[i - coin] + 1 ? dp[i] : dp[i - coin] + 1;
      }
    }
  }
  return dp[amount] > amount ? -1 : dp[amount];
}
