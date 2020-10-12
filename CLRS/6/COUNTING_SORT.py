def COUNTING_SORT(A,k):
    C=[0 for i in range(0,k+1)]
    B=[0 for i in range(0,len(A))]
    for j in range(0,len(A)):
        C[A[j]]+=1
    for i in range(1,k+1):
        C[i]+=C[i-1]
    for j in range(len(A)-1,-1,-1):
        B[C[A[j]]-1]=A[j]
        C[A[j]]-=1
    return B
A=[4,35,32,23,3,21,2,5,6,9]   
B=COUNTING_SORT(A,40) 
print(B)