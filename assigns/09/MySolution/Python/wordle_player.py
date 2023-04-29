import random

########################
# HX-2023-04-15: 20 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess.
"""
########################################################################

def wordle_guess(hints):

    alphabet = set('abcdefghijklmnopqrstuvwxyz')

    result = [None] * len(hints[0])


    karne_do = {}


    for hint in hints:
   
        used_letters = {}
    
        for i, (x, c) in enumerate(hint):
            
            if x == 1 and result[i] != c:
                
                result[i] = c
            
                if c in karne_do:
                    
                    if karne_do[c][0] == 0:
                        
                        del karne_do[c]
                        
                    else:
                        
                        karne_do[c][0] -= 1
                        
            elif x == 0:
                
                alphabet.discard(c)
                
                if c not in karne_do:
                    
                    karne_do[c] = [0, []]
                    
                karne_do[c][1].append(i)

            elif x == 2:
                
                if c not in karne_do:
                    
                    karne_do[c] = [0, []]
                    
                if not used_letters.get(c):
                    
                    karne_do[c][0] += hint.count((2, c))
                    
                    used_letters[c] = True
                    
                karne_do[c][1].append(i)
    
    for key, value in karne_do.items():
        
        for i in range(value[0]):
            
            for j, char in enumerate(result):
                
                if char is None and j not in value[1]:
                    
                    result[j] = key
                    
                    break
 
    for j, char in enumerate(result):
        
        if char is None:
            
            result[j] = random.choice(list(alphabet))
            
    return ''.join(result)

########################################################################
