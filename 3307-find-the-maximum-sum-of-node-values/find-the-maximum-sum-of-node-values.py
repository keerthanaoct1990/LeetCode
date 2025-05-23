class Solution:
    def maximumValueSum(self, nums: List[int], k: int, edges: List[List[int]]) -> int:
        gains = [(num ^ k) - num for num in nums]
        
        # Step 2: Find total base sum and sort gains by how beneficial flipping is
        base_sum = sum(nums)
        gains.sort(reverse=True)
        
        # Step 3: To preserve parity (since each flip toggles 2 nodes), pick even number of best flips
        max_gain = 0
        for i in range(0, len(gains), 2):
            if i + 1 < len(gains) and gains[i] + gains[i + 1] > 0:
                max_gain += gains[i] + gains[i + 1]
            else:
                break  # no more beneficial pairs

        return base_sum + max_gain