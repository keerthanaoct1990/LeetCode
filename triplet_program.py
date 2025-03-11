class Solution(object):
    def threeSum(self, nums):
        triplets = set()
        final_list = []
        nums.sort()
        for i in range(len(nums)):
            j = i+1
            k = len(nums) - 1
            while(j < k):
                sum = nums[i] + nums[j] + nums[k]
                if sum == 0:
                    triplets.add((nums[i], nums[j], nums[k]))
                    j = j+1
                    k = k-1
                elif sum < 0:
                    j = j+1
                else:
                    k = k-1
        for values in triplets:
            final_list.append(list(values))
        return final_list
        