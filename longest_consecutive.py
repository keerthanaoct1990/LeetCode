class Solution(object):
    def longestConsecutive(self, nums):
        num_set = set(nums)
        if not nums:
            return 0
        
        longest = 1
        for num in num_set:
            count = 1
            if num-1 not in num_set:
                x = num
                while x+1 in num_set:
                    count += 1
                    x += 1
            longest = max(longest, count)
        return longest
        