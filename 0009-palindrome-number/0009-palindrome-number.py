class Solution(object):
    def isPalindrome(self, x):
        str_num = str(x)
        if str_num[::-1] == str(x):
            return True
        else:
            return False
        