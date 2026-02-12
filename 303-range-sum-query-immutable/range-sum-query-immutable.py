class NumArray:

    def __init__(self, nums: List[int]):
        if not nums:
            self.sum_prefix = []
            return
        self.sum_prefix = [nums[0]]

        for i in range(1, len(nums)):
            self.sum_prefix.append(self.sum_prefix[i-1]+nums[i])

    def sumRange(self, left: int, right: int) -> int:
        if left == 0:
            return self.sum_prefix[right]
        return self.sum_prefix[right] - self.sum_prefix[left-1]
        


# Your NumArray object will be instantiated and called as such:
# obj = NumArray(nums)
# param_1 = obj.sumRange(left,right)