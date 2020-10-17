def MAXTRIX_CHAIN_ORDER(p):
    n=len(p)-1
    m=[[0 for i in range(0,n+1)] for  i in range(0,n+1)]
    S=[[-1 for i in range(0,n+1)] for  i in range(0,n+1)]
    for l in range(2,n+1):#l为链的长度 
        for i in range(1,n-l+1+1): #n-l+1为最右的长度为l的矩阵链d的起点
            j=i+l-1#从i开始的到j结束的长度为l的矩阵链
            m[i][j]=float('inf')
            for k in range(i,j):#对i，j进行划分
                q=m[i][k]+m[k+1][j]+p[i-1]*p[k]*p[j]
                if q<m[i][j]:
                    m[i][j]=q
                    S[i][j]=k
    return m,S
def PRINT_OPTIMAL_PARENS(S,i,j):
    if i==j:
        print(f"A{i}",end='')
    else:
        print("(",end='')
        PRINT_OPTIMAL_PARENS(S,i,S[i][j])
        PRINT_OPTIMAL_PARENS(S,S[i][j]+1,j)
        print(")",end='')
p=[30,35,15,5,10,20,25]
m,S=MAXTRIX_CHAIN_ORDER(p)
PRINT_OPTIMAL_PARENS(S,1,6)

                
