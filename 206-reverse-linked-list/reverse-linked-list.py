# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def reverseList(self, head):
        """
        :type head: Optional[ListNode]
        :rtype: Optional[ListNode]
        """
        if head:
            temp = head
            after = temp.next
            before = None
            while temp:
                after = temp.next
                temp.next = before
                before = temp
                temp = after
            head = before
        return head
            