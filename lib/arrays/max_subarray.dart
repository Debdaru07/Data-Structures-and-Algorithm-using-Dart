/* Problem: Maximum Subarray

Given an integer array nums, find the contiguous subarray
(containing at least one element) which has the largest sum
and return that sum.

Key points:
- Subarray must be contiguous (elements must be next to each other)
- Subarray must contain at least one element
- We only return the maximum sum, not the subarray itself

Example:
Input:  [-2, 1, -3, 4, -1, 2, 1, -5, 4]
Output: 6

Explanation:
The subarray [4, -1, 2, 1] gives the maximum sum:
4 + (-1) + 2 + 1 = 6
*/

/* Approach:

We iterate through the array and at each index decide:
- Either extend the existing subarray by adding the current element
- Or start a new subarray from the current element

If the sum of the subarray so far becomes negative,
it is better to discard it because it will reduce the
sum of any future subarray.

We maintain:
1. currentSum -> maximum subarray sum ending at the current index
2. maxSum     -> maximum subarray sum found so far

At every step:
- currentSum = max(current element, currentSum + current element)
- Update maxSum if currentSum is greater

Finally, maxSum will contain the answer.
*/

List<int> maxSubArray(List<int> input) {
  List<int> maxSubArray = [];
  for (int i = 0; i < input.length; i++) {}
  return maxSubArray;
}
