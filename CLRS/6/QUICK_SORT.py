import random
def swap(A,i,j):
    tmp=A[j]
    A[j]=A[i]
    A[i]=tmp
def RANDOM_PARTITION(A,l,r):
    i=random.randint(l,r)
    swap(A,i,r)
    return PARTITION(A,l,r)
def QUICK_SORT(A,l,r):
    if(l<r):
        q=RANDOM_PARTITION(A,l,r)
        QUICK_SORT(A,l,q-1)
        QUICK_SORT(A,q+1,r)
def PARTITION(A,l,r):
    flag=A[r]
    i=l #确保i一直在flag的位置且A[i]>flag
    for j in range(l,r):
        if(A[j]<flag):
           swap(A,i,j)
           i+=1
    swap(A,i,r)
    return i
A=[4,35,32,23,3,21,2,5,6,9]
QUICK_SORT(A,0,len(A)-1)
print(A)
    
     
