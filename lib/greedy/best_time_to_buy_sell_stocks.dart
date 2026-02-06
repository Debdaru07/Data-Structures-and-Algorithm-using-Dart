/* 
  Best time to buy and sell stocks

  You are given an array of integers 'prices', 
  where 'prices[i]' represents the price of a stock on day 'i', 

  Task: 
  You want to maximize your profit by choosing:
  - ONE day to buy a stock.
  - A Different day in the future to sell the stock.

  Rules: 
  - You may complete at most ONE transaction (one buy and one sell).
  - You must buy BEFORE you sell.
  - If no profit is possible, return 0.

  Example 1: 
  prices = [7,1,5,3,6,4]
  Explanation: 
  Buy on day 1 (price = 1)
  Sell on day 4 (price = 6)
  Profit = 6 - 1 = 5

  Example 2: 
  prices = [7, 6, 4, 3, 1]
  Explanation: 
  No profitable transactions is possible.
  Output = 0

  Constraints:
  - 1 <= prices.length <= 10 ^ 5
  - 0 <= prices[i] <= 10 ^ 4

  Goal:
  Return the maximum profit you can achieve from a single buy 
  and a single sell operation.
*/

/* 
  Approach to solve Best Time to Buy and Sell Stock

  Observation:
  - We are allowed ONLY ONE transaction (one buy + one sell).
  - Buy must happen BEFORE sell.
  - We want to maximize: selling_price - buying_price

  Brute Force Idea (NOT optimal):
  - Try all pairs (i,j) where i<j
  - Calculate prices[j] - prices[i]
  - Take the maximum profit
  - Time Complexity: O(n^2) -> too slow

  Optimized Insight:
  - Instead of checking all pairs, 
    we only need to know:
      1. The minimum price seen so far (best day to buy)
      2. The maximum profit we can make till today

  Key Idea:
  - Traverse the prices array ONCE.
  - At each day:
    - Assume we sell on this day
    - Check how much profit we get if we had bought at the lowest 
      price seen before this day

  Variables to track: 
  - minPrice:
      Stores the minimum stock price seen so far

  - maxProfit: 
      Stores the maximum profit found till now.

  Step-by-step logic:
  - Initialize minPrice with a very large value
  - Initialize maxProfit as 0
  - For each price in prices:
      a. If current_price < min_price:
        - Update minPrice
        - This becomes a better day to buy
      b. Else: 
        - Calculate profit = current price - minPrice
        - Update maxProfit if this profit is greater

  Why this works: 
    - we always buy at the lowest price BEFORE today.
    - we always sell AFTER buying
    - We never violate the order of buy -> sell.

  Edge Case:
    - If prices keep decreasing:
      - maxProfit never increases
      - Final answer remains 0
    
  Time Complexity: 
    - O(n) -> single pass
  
  Space Complexity:
    - O(1) -> no extra space required
*/
