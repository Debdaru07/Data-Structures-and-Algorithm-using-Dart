/* Coin Change Problem :- 

  You are given an integer array 'coins' representing different denominations
  of coins, and an integer 'amount' representing a total amount of money.

  Your task is to find the minimum number of coins required to make up exactly the
  given 'amount'.

  You can assume that you have an **infinte** supply of each type of coin.

  If it is not possible to make the exact amount using the given coin denominations, return '-1'.

  Example: 
  coins = [1, 2, 5], amount = 11
  Output = 3
  Explanation: 11 can be made using 5 + 5 + 1

  Example: 
  coins = [3], amount = 3
  Output = -1
  Explanation: It is not possible to make amount 3 using coins 2.

  Constraints: 
    - 1 <= coins.length <= 12
    - 1 <= coins[i] <= 10^4
    - 0 <= amount <= 10^4

*/

/* 
  Approach - Coin Change (Mnimum coins)

  1. Understand what is being asked: 
    - We want the MINIMUM number of coins to make a given amount.
    - Each coin can be used unlimited times
    - Order of coins does not matter.

  2. Identify overlapping subproblems: 
    - To find min coins for 'amount', we need answers for smaller amounts like: 
  amount - coin1, amount - coin2, ...
    - These subproblems repeat -> Dynamic Programming fits.
  
  3. Define the DP State:
    - dp[i] = minimum number of coins required to make amount 'i'

  4. Initialize the DP array:
    - Create dp array of size (amount + 1)
    - Initialize all values with a large number(infinity) because we are minimizing,
  
  5. Initialize the DP Array: 
    - Create dp array of size(amount + 1)
    - Initialize all values with a large number (infinity) because we are
      minimizing.

  6. Transition (core logic):
    - For every amount '1' from 1 to 'amount' : 
      - Try every coin in 'coins'
      - If coin <= i:
        dp[i] = min(dp[i], dp[i-coin] + 1)
    - Meaning: 
      "If I use this coin last, how many coins did it take to make
      the remaining amount ?"
  7. Final Answer: 
    - If dp[amount] is still infinity, return -1 (not possible).
    - Otherwise, return dp[amount].

  8. Why this works: 
    - We build the solution bottom-up.
    - Each amount uses already solved smaller amounts.
    - We always keep the minimum number of coins.

  Time Complexity: 
    - O(amount x number_of_coins)

  Space Complexity: 
    - O(amount)  

*/
