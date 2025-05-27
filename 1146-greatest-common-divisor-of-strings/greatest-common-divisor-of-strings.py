class Solution:
    def gcdOfStrings(self, str1: str, str2: str) -> str:
        len1, len2 = len(str1), len(str2)
        for l in range(min(len1, len2), 0, -1):
            if len1 % l or len2 % l:
                continue
            f1, f2 = len1//l , len2//l
            if str1[:l] * f1 == str1 and str1[:l] * f2 == str2:
                return str1[:l]
        return ""
        