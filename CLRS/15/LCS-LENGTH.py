def LCS_LEGTH(X,Y):
    m=len(X)
    n=len(Y)
    S=[[0 for i in range(0,m+1)] for j in range(0,n+1)]
    C=[[0 for i in range(0,m)] for j in range(0,n)]
    for i in range(1,m+1):
        for j in range(1,n+1):
            if X[i]==Y[j]:
                C[i][j]=C[i-1][j-1]+1
                S[i][j]="↖"
            elif C[i-1,j]>=C[i][j-1]:
                 C[i][j]=C[i-1][j]
                 S[i][j]="↑"
            else:
                C[i][j]=C[i][j-1]
                S[i][j]="←"
#当遇到第一个↖时，即xi=yj时LCS的第一个元素。可以逆序打印
def PRINT_LCS(S,X,i,j):
    if i==0 or j==0:
        return
    if S[i,j]=="↖":
        PRINT_LCS(S,X,i-1,j-1)
        print(X[i])
    elif S[i][j]=="↑":
        PRINT_LCS(S,X,i-1,j)
    else:
        PRINT_LCS(S,X,i,j-1)

        

            