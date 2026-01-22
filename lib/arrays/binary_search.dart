/*
📌 Problem: Two Sum

Given an array of integers `nums` and an integer `target`,
return the indices of the two numbers such that they add up to `target`.

You may assume:
- Exactly one valid solution exists.
- You may NOT use the same element twice.
- You can return the answer in any order.

🧠 Example:
Input:  nums = [2, 7, 11, 15], target = 9
Output: [0, 1]

Explanation:
nums[0] + nums[1] = 2 + 7 = 9

🔍 Constraints:
- 2 <= nums.length <= 10^5
- -10^9 <= nums[i] <= 10^9
- -10^9 <= target <= 10^9

🎯 Goal:
Solve this in better than O(n²) time.

💡 Hint:
Think about storing previously seen numbers and checking
if (target - current number) already exists.
*/

/* Approach:

1. Create a Hashmap to store numbers and their indices. 
   
  Key -> number from Array.
  Value -> index of that number.

2. Loop through the array from index 0 to n-1.

3. For each element: 
  - Calculate complement = target - current Number
  - Check if complement exists in the HashMap

4. If it exists :
  - Return the index of the complement (from Map)
  - Return current Index.

5. If it does not exist :
  - Store current number and its index in the HashMap

6. Since exactly one solution exists. 
  - the function will return before the loop ends

*/

List<int> twoSum(List<int> input, int target) {
  final Map<int, int> seen = {};
  for (int i = 0; i < input.length; i++) {
    int current = input[i];
    int complement = target - current;
    if (seen.containsKey(complement)) {
      return [seen[complement]!, i];
    } else {
      seen[current] = i;
    }
  }
  throw Exception('No two sum solution found');
}
