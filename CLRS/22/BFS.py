import Graph
import queue
'''
BFS为node赋予一些属性
color[node]:白，灰，黑，表示是否被访问过
node[node]:表示该节点的前驱
''' 
def BFS(G,s):
    dict={}
    str=input("input root:")
    for u in G.name_list:
        if u !=str:
           dict[u]=["white",int(-1),None]
    dict[str]=["GRAY",0,None]
    q=queue.Queue(maxsize=100)
    q.put(str)
    print(str,end=" ")
    while(q.empty()!= True):
        u=q.get()#开始找u这个节点的相邻节点
        for v in G.list.get(u,None):
            v_bfs_attribute=dict.get(v.name,None)
            if  v_bfs_attribute[0] == "white":
                print(v.name,end=" ")
                v_bfs_attribute[0] = "GRAY"
                v_bfs_attribute[1] = dict.get(u,None)[1]+1
                v_bfs_attribute[2] = u
                q.put(v.name)
        v_bfs_attribute    = dict.get(u,None)
        #v_bfs_attribute[0] = "BLACK"  
    print()
    print(dict)



def init_G():
    file=open("c:/Users/15775/OneDrive/mit/solution/CLRS/22/G.txt",mode="r")
    name_list=file.readline().split()
    num=int(file.readline())
    G=Graph.AdjacenyList(name_list,num)
    for _ in range(0,num):
        str=file.readline().split()
        G.insert(str[0],str[1],str[2])
    file.close()
    #print(G)
    return G
if __name__ == "__main__":
    G=init_G()
    BFS(G,str)