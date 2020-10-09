def HEAP_SORT(A):
    BUILD_MAX_HEAP(A)
    HEAP_SIZE=len(A)
    for i in range(len(A)-1,0,-1):
        temp = A[0]
        A[0]=A[i]
        A[i]=temp
        HEAP_SIZE-=1
        MAX_HEAPIFY(A,HEAP_SIZE,0)
def MAX_HEAPIFY(A,HEAP_SIZE,i):
    l=2*i+1
    r=2*i+2
    if l< HEAP_SIZE and A[l]>A[i]:
        largest=l
    else:
        largest=i
    if r< HEAP_SIZE and A[r]>A[largest]:
        largest=r
    if largest!=i:
        temp = A[i]
        A[i]=A[largest]
        A[largest]=temp
        MAX_HEAPIFY(A,HEAP_SIZE,largest)
def BUILD_MAX_HEAP(A):
    A_len= len(A)
    for i in range((A_len//2)-1,-1,-1):
        MAX_HEAPIFY(A,len(A),i)
if __name__ == '__main__':
    A=[4,35,32,23,3,21,2,5,6,9]
    HEAP_SORT(A)
    print(A)