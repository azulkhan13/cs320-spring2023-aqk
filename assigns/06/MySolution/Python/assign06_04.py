####################################################
#!/usr/bin/env python3
####################################################


import sys
sys.path.append('../../../06')
sys.path.append('./../../../../mypylib')
from dictwords import *
from mypylib_cls import *
####################################################
"""
HX-2023-03-24: 30 points
Solving the doublet puzzle
"""
####################################################
#def doublet_stream_from(word):
    
def word_neighbors(word):
   
        def subs(word, i):
        
            return word[i]

        def lenss(word):
        
            return string_foldleft(word,0,lambda r, x: r + 1)

        def imps(wlist):
        
            return foreach_to_foldleft(fnlist_foreach)(wlist, "", lambda r, x0: r + x0)

        def asst(length, fopr):
        
            return fnlist_reverse\
            (int1_foldleft(length,fnlist_nil(), lambda r, x1: fnlist_cons(fopr(x1),r)))

        def string_tabulate(length,fopr):
        
            return imps(asst(length,fopr))
                
        def    AB():
        
            return "abcdefghijklmnopqrstuvwxyz"

        wlen = lenss(word)

        return \
        fnlist_concat(string_imap_fnlist\
                      (word, lambda i, c: fnlist_concat\
                       (string_imap_fnlist(AB(), lambda _, c1: fnlist_sing\
                                           (string_tabulate(wlen, lambda j: subs(word, j) if i != j else c1)) if (c != c1) else fnlist_nil()))))
        
def doublet_stream_from(word):
    
    def fchildren(words, w):
        neighbor = word_neighbors(words[-1])
            
        def helper(x):
                
            if word_is_legal(x):
                    
                w.put(words + (x,))
                    
        fnlist_foreach(neighbor, lambda r: helper(r))
            
        return None
    
    def gtree_bfs(wd, fchlds):
        
        def helper(x):
            
            if x.empty():
                return strcon_nil()
            else:
                wds = x.get()
                fchlds(wds, x)
            return strcon_cons(wds, lambda: helper(x))
            
        return lambda: helper(wd)

    wordQueue = queue.Queue()
    wordQueue.put((word,))

    return gtree_bfs(wordQueue, fchildren)
#
"""
Please revisit assign05_02.py.
######
Given a word w1 and another word w2, w1 and w2 are a
1-step doublet if w1 and w2 differ at exactly one position.
For instance, 'water' and 'later' are a 1-step doublet.
The doublet relation is the reflexive and transitive closure
of the 1-step doublet relation. In other words, w1 and w2 are
a doublet if w1 and w2 are the first and last of a sequence of
words where every two consecutive words form a 1-step doublet.
Here is a little website where you can use to check if two words
for a doublet or not:
http://ats-lang.github.io/EXAMPLE/BUCS320/Doublets/Doublets.html
######
Given a word, the function [doublet_stream_from] returns a stream
enumerating *all* the tuples such that the first element of the tuple
is the given word and every two consecutive words in the tuple form a
1-step doublet. The enumeration of tuples should be done so that shorter
tuples are always enumerated ahead of longer ones.
######
"""

####################################################
