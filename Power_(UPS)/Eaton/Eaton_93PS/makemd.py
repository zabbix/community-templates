import re

with open(".\\Power_(UPS)\\Eaton\\Eaton_93PS\\6.4\\template_eaton_93ps.yaml",encoding='UTF-8') as f:
  state = 0
  lines=f.readlines();
  t=''.join(lines);
  t=t.replace('\n','¨')
  sExp = "¨\s+name: ([^¨]+)¨\s+type: ([^¨]+)¨\s+snmp_oid: ([^¨]+)¨\s+key: ([^¨]+)¨\s+delay: '([^¨]+)'¨"
  sExp2 = "\s+triggers:¨ (\s+-¨\s+uuid: \w+¨\s+expression: '([^¨]+)'¨\s+name: ([^¨]+)¨)+"
  res=re.findall(sExp,t)
  res2= re.findall(sExp2,t)
  print("***\n***\n"+str(len(res))+" items\n"+str(len(res2))+" triggers\n")
  for l in res:
    print ('|'+l[0]+"|<p>-</p>|`"+l[1]+"`|"+ l[3]+"<p>Update: "+ l[4] +"</p>|")
  
  print("|Name|Description|\n|----|-----------|\n")

  for l in res2:
    print ('|'+l[2]+"|"+l[1]+"|\n")
  

  
