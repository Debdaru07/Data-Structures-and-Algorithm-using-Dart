import 'package:dsa_dart/linked_list/reverse_linked_list.dart';
import 'package:test/test.dart';

void main() {
  group('reverseLinkedList', () {
    test('reverses a normal linked list', () {
      final head = ListNode(
        1,
        ListNode(
          2,
          ListNode(
            3,
            ListNode(4),
          ),
        ),
      );

      final reversedHead = reverseLinkedList(head);

      expect(reversedHead?.value, 4);
      expect(reversedHead?.next?.value, 3);
      expect(reversedHead?.next?.next?.value, 2);
      expect(reversedHead?.next?.next?.next?.value, 1);
      expect(reversedHead?.next?.next?.next?.next, null);
    });

    test('handles single node list', () {
      final head = ListNode(1);

      final reversedHead = reverseLinkedList(head);

      expect(reversedHead?.value, 1);
      expect(reversedHead?.next, null);
    });

    test('handles empty list', () {
      final reversedHead = reverseLinkedList(null);
      expect(reversedHead, null);
    });

    test('handles two node list', () {
      final head = ListNode(1, ListNode(2));
      final reversedHead = reverseLinkedList(head);
      expect(reversedHead?.value, 2);
      expect(reversedHead?.next?.value, 1);
      expect(reversedHead?.next?.next, null);
    });
  });
}
