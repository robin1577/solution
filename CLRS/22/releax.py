import math
dict={}
#除源点外，源点到其余点的距离设置为无穷大
def INITIALIZE_SINGLE_SOURCE(G,s):
    global dict
    for v in G.list:
        dict[v]=[float('inf'),None]
    dict.get(s,None)[0]=0
#一旦s到v的距离 <  s到u + u到v     u，v是邻边    就松弛
def RELAX(u,v,w):
    global dict
    v_= dict.get(v,None)
    u_= dict.get(u,None)
    if v_[0] > u_[0]+w(u,v):
        v_[0]=u_[0]+w(u,v)
        v_[1]=u
def BELLMAN_FORD(G,w,s):
    INITIALIZE_SINGLE_SOURCE(G,s)
    #对每条边进行|V|-1次松弛操作
    for _ in range(1,len(G.Node_num)):
        for u,value in G.list.items():
            for v in value:
                RELAX(u,v.name,v.weight)
    for u,value in G.list.items():
            for v in value:
                if dict.get(v.name,None)[0] > dict.get(u,None)[0] + w(u,v.name):
                    return False
    return True
