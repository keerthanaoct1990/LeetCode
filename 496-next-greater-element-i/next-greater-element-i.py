class Solution:
    def nextGreaterElement(self, nums1: List[int], nums2: List[int]) -> List[int]:
        next_greater_map = {}
        stack = []
        for num in nums2:
            while stack and stack[-1] < num:
                prev = stack.pop()
                next_greater_map[prev] = num
          
            stack.append(num)
        return [next_greater_map.get(num, -1) for num in nums1]