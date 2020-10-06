def find_maximum_subarray(A,low,high):
    if(low==high):
        return(low,high,A[low])
    else:
        mid=(low+high)//2
        left_low,left_high,left_sum=find_maximum_subarray(A,low,mid)
        right_low,right_high,right_sum=find_maximum_subarray(A,low+1,high)
        mid_low,mid_high,mid_sum=find_max_crossing_subarray(A,low,mid,high)
        if mid_sum>=left_sum and mid_sum>=right_sum:
            return(mid_low,mid_high,mid_sum)
        elif left_sum>=mid_sum and left_sum>=right_sum:
            return(left_low,left_high,left_sum)
        else:
             return(right_low,right_high,right_sum)
def find_max_crossing_subarray(A,low,mid,high):
    left_sum=-float('inf')
    sum=0
    for i in range(mid,low-1,-1):
        sum += A[i]
        if sum > left_sum:
            left_sum = sum
            left_low = i

    right_sum=-float('inf')
    sum=0
    for i in range(mid+1,high+1):
        sum += A[i]
        if sum > right_sum:
            right_sum = sum
            right_high = i
    
    return(left_low,right_high,left_sum+right_sum)
A=[13,-3,-25,20,-3,-16,-23,18,20,-7,12,-5,-22,15,-4,7]
max=find_maximum_subarray(A,0,len(A)-1)
print(max)

    