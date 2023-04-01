####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
"""
HX-2023-03-24: 20 points
Solving the N-queen puzzle
"""
####################################################

def solve_N_queen_puzzle(N):

    def nqueen(bd):
        
        res = 0
        
        for j0 in bd:
            
            if j0 <= 0:
                
                break
            
            else:
                
                res = res + 1
                
        return res

    def board_safety_all(bd):
        
        return int1_forall(nqueen(bd), lambda i0: board_safety_one(bd, i0))
    
    def board_safety_one(bd, i0):
        
        def helper(j0):
            
            pi = bd[i0]
            
            pj = bd[j0]
            
            return pi != pj and abs(i0-j0) != abs(pi-pj)
        
        return int1_forall(i0, helper)

    def board(bd, i0, j0):
        
        x = list(bd)
        
        x[i0] = j0
        
        return tuple(x)

    def placement(bd, i0, j0):
        
        def helper(x0):
            
            pos = bd[x0]
            
            return pos != j0 and abs(i0-x0) != abs(j0-pos)
        
        return int1_forall(i0, helper)

    def fchildren(nxs, c, x):
        
        queen = nqueen(nxs)
        
        def valid(n):
            
            if placement(nxs, queen, n):
                
                bd = board(nxs, queen, n)
                
                x.put(bd)

        int1_foreach(c + 1, lambda r: () if r == 0 else valid(r))
        
        return None

    def gtree_dfs(nxs, fchlds, c):
        
        def helper(qnxs):
            
            if qnxs.empty():
                
                return strcon_nil()
            
            else:
                
                nx1 = qnxs.get()

                fchlds(nx1,c,qnxs)
                
                return strcon_cons(nx1, lambda: helper(qnxs))
            
        return lambda: helper(nxs)

    qnxs = queue.LifoQueue()
    
    qnxs.put((0,) * N)

    return stream_make_filter(gtree_dfs(qnxs, fchildren, N), lambda r: nqueen(r) == N)
####################################################
