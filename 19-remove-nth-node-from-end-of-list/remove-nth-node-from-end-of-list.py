# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        slow = head
        fast = head
        for _ in range(n):
            if fast.next is None:
                return head.next
            fast = fast.next
           
        while fast.next:
            slow = slow.next
            fast = fast.next
        temp = slow.next
        slow.next = temp.next
        temp.next = None
        return head
        