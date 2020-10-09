import HEAP_SORT
def HEAP_MAXIMUM(A):
    return A[0]
def HEAP_EXTRACT_MAX(A):
    heap_size=len(A)
    if heap_size<1:
        print("Error heap underflow")
        return None
    max=A[0]
    A[0]=A[heap_size-1]
    A.pop()
    HEAP_SORT.MAX_HEAPIFY(A,heap_size-1,0)
    return max
def PARENT(i):
    return (i-1)//2
def HEAP_INCREASE_KEY(A,i,key):
    if key<A[i]:
        print("new key is smaller than currently key")
        return None
    A[i]=key
    while i>0 and A[PARENT(i)]<A[i]:
        temp=A[i]
        A[i]=A[PARENT(i)]
        A[PARENT(i)]=temp
        i=PARENT(i)
def MAX_HEAP_INSERT(A,key):
    inf=float("-inf")
    A.append(inf)
    HEAP_INCREASE_KEY(A,len(A)-1,key)
A=[15,13,9,5,12,8,7,4,0,6,2,1]
HEAP_SORT.BUILD_MAX_HEAP(A)
print(A)
print(HEAP_EXTRACT_MAX(A))
print(A)


