def merge(A,low,mid,high):
    L=A[low:mid+1]
    H=A[mid+1:high+1]
    L.append(float("inf"))
    H.append(float("inf"))
    i=j=0
    for k in range(low,high+1):
        if L[i]<=H[j]:
            A[k]=L[i]
            i+=1
        else:
            A[k]=H[j]
            j+=1
    return 
def merge_sort(A,low,high):
    if(low<high):
        mid=(low+high)//2
        print(mid)
        merge_sort(A,low,mid)
        merge_sort(A,mid+1,high)
        merge(A,low,mid,high)
A=[4,35,32,23,3,21,2,5,6,9]
merge_sort(A,0,len(A)-1)
print(A)

