class Solution(object):
    def mergeAlternately(self, word1, word2):
        """
        :type word1: str
        :type word2: str
        :rtype: str
        """
        merged = ''
        l = min(len(word1), len(word2))
        for x,y in zip(word1[:l], word2[:l]):
            merged += x+y
        merged += word1[l:]+word2[l:]
        return merged
