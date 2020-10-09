def insert_sort(A):
    for j in range(2,len(A)-1):
        key = A[j]
        i=j-1
        while( i>0 and key<A[i]):
            A[i+1]=A[i]
            i=i-1
        A[i+1]=key
    return A
print(insert_sort([1,3,5,6,7,8]))