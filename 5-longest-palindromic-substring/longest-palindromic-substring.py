class Solution:
    def longestPalindrome(self, s: str) -> str:
        output = {}
        for i in range(len(s)):
            for j in range(i+1, len(s) + 1):
                substr = s[i:j]
                if substr == substr[::-1]:
                    output[substr] = len(substr)
        return max(output, key = output.get)