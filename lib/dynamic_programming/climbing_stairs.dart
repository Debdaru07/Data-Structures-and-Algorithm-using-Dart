/*
  PROBLEM : Climbing Stairs (Dynamic Programming - 10)

  You are climbing a staircase that has 'n' steps

  At each step, you can either : 
    - climb 1 step, or
    - climb 2 steps

  QUESTION: 
  In how many distinct ways can you reach the top of the staircase ?

  ------------------------
  INPUT : 
  - An integer 'n' representing the total number of steps.

  OUTPUT : 
  - An integer representing the number of distinct ways to reach the top.

  ------------------------

  EXAMPLES : 

  Example 1: 
  Input: n = 2
  Output: 2
  Explanation: 
  - 1 step + 1 step
  - 2 steps

  Example 2: 
  Input: n = 3
  Output: 3
  Explanation: 
  - 1 + 1 + 1
  - 1 + 2
  - 2 + 1

  -----------------------

  IMPORTANT OBSERVATIONS (THINK BEFORE CODING): 

  1. From any step 'i', you can arrive there from: 
    - step (i-1)
    - step (i-2)

  2. The number of ways to reach step 'i' depends on previously computed steps
  
  3. This problem has: 
    - overlapping subproblems
    - optimal substructure
  
  -> These are strong Indicators that Dynamic Programming could be used.

  ----------------------
  CONSTRAINTS: 
  - 1 <= n <= large value (interviewers expect O(n))

  ----------------------

  QUESTIONS TO ANSWER BEFORE IMPLEMENTING: 

  1. what does dp[i] represent ? 
  2. what are the base cases ?
  3. How do we build the solution step by step ?
  4. Can space be optimized ?
  ----------------------

  EXPECTED COMPLEXITY: 
  - Time: O(n)
  - Space: O(n) or O(1)
  ----------------------

  NOTE: 
  Do Not Jump into code.
  First, write down: 
  - the recurrence relation
  - the base cases
  - a small dry run for n = 4 or n = 5

*/

/* 
  APPROACH :

  1. Define dp[i] as the number of distinct ways to reach step i.

  2. To reach step i, you can come from: 
    - step (i-1) by taking 1 step
    - step (i-2) by taking 2 steps

    Recurrence: 
    dp[i] = dp[i-1] + dp[i-2]

  3. Base cases: 
    - dp[1] = 1
    - dp[2] = 2

  4. Build the solution from bottom-up from 3 to n.
  5. Since only the last 2 values are needed, space can be optimized to O(1).

  Time Complexity: O(n)
  Space Complexity: O(1)

*/

int climbStairs(int n) {
  // Base Cases
  if (n <= 2) return n;

  // prev2 -> ways to reach(i-2)
  // prev1 -> ways to reach(i-1)
  int prev2 = 1;
  int prev1 = 2;

  for (int i = 3; i <= n; i++) {
    int current = prev1 + prev2;
    prev2 = prev1;
    prev1 = current;
  }

  return prev1;
}

// It looks like a Fibonacci Series
