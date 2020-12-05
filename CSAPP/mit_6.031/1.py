'''
静态检测
学习静态类型
了解好的软件应该具有的三个属性
'''
n=3
while n != 1:
    print(n)
    if n % 2 ==0:
        n = n / 2
    else:
        n = 3 * n + 1
print(n)
    