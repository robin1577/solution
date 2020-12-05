'''
Node.name     节点的名字
Node.data     卫星数据
Node.weight   边的权重
'''
class Node(object):
    def __init__(self,name,weight=1,data = None,):
        self.data   = data
        self.name   = name
        self.weight = weight
    def __str__(self):
        return repr()
    def __repr__(self):
        return self.name
'''
矩阵邻接表：
AdjacenyList.list 节点列表
保存边上权重，节点个数，边个数
'''
class AdjacenyList(object):
    def __init__(self,name_list,Enum,direction=None):
        self.name_list = name_list[:]
        self.Node_num  = len(self.name_list)
        self.list      = {name:[] for name in self.name_list}
        self.Enum      = Enum
        self.type      = direction
    def insert(self,start,end,weight=1,data=None):
        S=self.list.get(start, None)
        if(S==None):
            raise "error start not in V"
        node = Node(end,weight)
        S.append(node)
        #如果是无向图
        if self.type==None:
            S=self.list.get(end,None)
            if(S==None):
                raise "error start not in V"
            node = Node(start)
            S.append(node)
    def __str__(self):
        return str(self.list)