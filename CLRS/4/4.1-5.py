'''
思路：sum[low,higt,sum]用于存储A[j]的每个0-j的最大子数组
sum[j+1]=max(sum[j],A[j+1],A[j+1]+P[j]) 
P[j]为包含A[j]的最大子数组 (P[j]<=sum[j])
1~j+1的子数组中最大的在 (1~j中最大,A[j+1],A[j+1]+P[j])中  
'''
def find_maximum_subarray_iter(A):
    if len(A)==1:
        return(0,0,A[0])
    else:
        sum=[[0 for col in range(3)] for row in range(len(A))]
        p=[[0 for col in range(3)] for row in range(len(A))]
        sum[0]=[0,0,A[0]]
        p[0]=[0,0,A[0]]
        for j in range(0,len(A)-1):
            if sum[j][2]>=A[j+1] and sum[j][2]>=(A[j+1]+p[j][2]):
                sum[j+1]=sum[j]
            elif A[j+1]>=sum[j][2] and A[j+1]>=(A[j+1]+p[j][2]):
                sum[j+1]=[j+1,j+1,A[j+1]]
            else:
                sum[j+1]=[p[j][0],j+1,A[j+1]+p[j][2]]
            if p[j][2]>0:
                p[j+1][0]=p[j][0]
                p[j+1][1]=j+1
                p[j+1][2]=A[j+1]+p[j][2]
            else:
                p[j+1]=[j+1,j+1,A[j+1]]
        print(j)
        M=sum[len(A)-1]
        return(M[0],M[1],M[2])
A=[13,-3,-25,20,-3,-16,-23,18,20,-7,12,-5,-22,15,-4,7]
print(find_maximum_subarray_iter(A))