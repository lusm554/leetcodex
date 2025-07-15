class Solution:
    def reverseVowels(self, s: str) -> str:
        vowels_order = iter([v for v in s if v in 'aeiouAEIOU'][::-1])
        result = ''
        for char in s:
            if char in 'aeiouAEIOU':
                result += next(vowels_order)
            else:
                result += char
        return result
