class Solution:
    def kidsWithCandies(self, candies: List[int], extraCandies: int) -> List[bool]:
        output = []
        curr_max = max(candies)
        for i in range(0, len(candies)):
            candies[i] += extraCandies
        for candy in candies:
            if candy >= curr_max:
                output.append(True)
            else:
                output.append(False)
        return output
        
        