class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        bracket_map = {'}':'{', ')':'(', ']':'['}
        for chars in s:
            if chars in bracket_map.values():
                stack.append(chars)
            elif chars in bracket_map:
                if not stack or stack.pop() != bracket_map[chars]:
                    return False
        return not stack
            

        