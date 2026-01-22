/* 
  Problem: 
  Given the head of a singly linked list, reverse the list and return the new head.

  A singly linked list node contains: 
  - a value
  - a reference to the next node

  Examples: 
  - Input :- 1 -> 2 -> 3 -> 4 -> null
  - Output :- 4 -> 3 -> 2 -> 1 -> null 
*/

/* 
  Approach (Iterative) :- 

  1. Reversing a linked list means changing the direction of the next pointers, not values.

  2. We use 3 pointers :
    - prev: points to the previous node (initially null)
    - curr: points to the current node being processed 
    - next: temporarily store the next node

  3. For each node : 
    - Save the next node
    - Reverse the current node's next pointer
    - Move prev and current one step forward

  4. When current becomes null :
    - prev will be pointing to the new head of the reversed list

  Why this works :
  - We reverse links one by one without losing access to the list

  Time Complexity :
  - o(n), where n is the number of nodes

  Space Complexity :
  - O(1), since we reverse in-place  
*/

class ListNode {
  int value;
  ListNode? next;

  ListNode(this.value, [this.next]);
}

ListNode? reverseLinkedList(ListNode? head) {
  ListNode? prev = null;
  ListNode? current = head;
  while (current != null) {
    ListNode? next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }
  return prev;
}

// Rough Calculations :- 

// 1-> 2-> 3-> 4-> null

/* 
  prev = null, current = 1, next = 2 || prev = 1, current = 2, 
  prev = 1, current = 2, next = 3 || prev = 2, current = 3, 
  prev = 2, current = 3, next = 4 || prev = 3, current = 4,
  prev = 3, current = 4, next = null || prev = 4, current = null. 
*/  
// 
