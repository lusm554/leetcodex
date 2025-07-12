class Solution:
    def gcdOfStrings(self, str1: str, str2: str) -> str:
        from math import gcd
        n = gcd(len(str1), len(str2))
        sub = str1[:n]
        if sub * (len(str1) // n) == str1 and sub * (len(str2) // n) == str2:
            return sub
        return ""
