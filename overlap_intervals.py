class Solution(object):
    def merge(self, intervals):
        intervals.sort()
        merged = []
        for values in intervals:
            if not merged or values[0] > merged[-1][-1]:
                merged.append(values)
            else:
                merged[-1][-1] = max(merged[-1][-1], values[-1])
        return merged
            
        