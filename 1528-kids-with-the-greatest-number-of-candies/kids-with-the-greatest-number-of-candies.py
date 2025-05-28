class Solution:
    def kidsWithCandies(self, candies: List[int], extraCandies: int) -> List[bool]:
        output = []
        curr_max = max(candies)
        for candy in candies:
            if candy + extraCandies >= curr_max:
                output.append(True)
            else:
                output.append(False)
        return output
        
        