import random
def RADOMIXED_SELECT(A,p,r,i):
    if p==r:
        return A[p]
    q=RANDOM_PARTITION(A,p,r)
 #   k=q-p+1
    if i==q+1:
        return A[q]
    elif i<q+1:
        return RADOMIXED_SELECT(A,p,q-1,i)
    else:
        return RADOMIXED_SELECT(A,q+1,r,i)
def swap(A,i,j):
    tmp=A[j]
    A[j]=A[i]
    A[i]=tmp
def RANDOM_PARTITION(A,l,r):
    i=random.randint(l,r)
    swap(A,i,r)
    return PARTITION(A,l,r)
def PARTITION(A,l,r):
    flag=A[r]
    i=l #确保i一直在flag的位置且A[i]>flag
    for j in range(l,r):
        if(A[j]<flag):
           swap(A,i,j)
           i+=1
    swap(A,i,r)
    return i
A=[4,7,10,8,3,1,2,5,6,9]
print(RADOMIXED_SELECT(A,0,len(A)-1,1))