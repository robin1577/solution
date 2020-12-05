import Graph
time=0
dict={}
def DFS(G):
    global dict
    for u in G.name_list:
        dict[u]=["WHITE",None,None]
    for u in G.name_list:
        if dict.get(u,None)[0] == "WHITE":
            DFS_VISIT(G,u)
def DFS_VISIT(G,u):
    global time
    global dict
    time += 1 #该节点发现时间
    udfs=dict.get(u,None)
    udfs[0] = "GRAY"
    udfs[1] = time
    for v in G.list.get(u,None):
        if dict.get(v.name,None)[0] == "WHITE":
            v.pre=u
            DFS_VISIT(G,v.name)
    udfs[0] = "BLACK"
    time = time+1
    udfs[2] = time #该节点完成时间
def init_G():
    file=open("c:/Users/15775/OneDrive/mit/solution/CLRS/22/G_2.txt",mode="r")
    name_list=file.readline().split()
    num=int(file.readline())
    G=Graph.AdjacenyList(name_list,num,True)
    for _ in range(0,num):
        str=file.readline().split()
        G.insert(str[0],str[1],str[2])
    file.close()
    print(G)
    return G
if __name__ == "__main__":
    G=init_G()
    DFS(G)
    print(dict)
        
