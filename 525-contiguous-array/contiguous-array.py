class Solution:
    def findMaxLength(self, nums: List[int]) -> int:
        nums = [-1 if num==0 else 1 for num in nums]
        index_map = {0:-1}
        prefix_sum = 0
        max_length = 0

        for i, num in enumerate(nums):
            prefix_sum = prefix_sum + num
            if prefix_sum in index_map:
                max_length = max(max_length, i-index_map[prefix_sum] )
            else:
                index_map[prefix_sum] = i
        return max_length