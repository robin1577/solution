def CUT_ROD(p,n):
    r=-float('inf')
    if n==0:
        return 0
    else:
        for i in range(1,n):
            r=max(r,p[i-1]+CUT_ROD(p,n-i))
    return r
def MEMOIZED_CUT_ROD(p,n):
    R=[(-float('inf')) for i in range(0,n)]
    MEMOIZED_CUT_ROD_AUX(p,n,R)
def MEMOIZED_CUT_ROD_AUX(p,n,R):
    if R[n-1]>=0:
        return R[n-1]
    if n==0:
        return 0
    else:
        r=-float('inf')
        for i in range(1,n):
                r=max(r,p[i-1]+MEMOIZED_CUT_ROD_AUX(p,n-i,R))
    R[n-1]=r  
    return r
#自底向上
def BOTTOM_UP_CUP_ROD(p,n):
    R=[0]
    for i in range(1,n+1):
        q=-float('inf')
        for j in range(1,i+1):
            q=max(q,p[i-1]+R[j-i])
        R[i]=q
    return R[n]
#带有选择策略信息的自底向上