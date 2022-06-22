import os
fpath = 'pkg/cfg/config/endpoints-development.yml'
home_folder = os.getenv("HOME") or "/Users/sainath"
fpath = home_folder+'/go/src/github.com/epifi/gamma/'+fpath
f = open(fpath,'r')
lines = f.readlines()
f.close()

new_file_str = ""
flag = 0

for line in lines:
    if line == 'FrontendEndpoint:\n' or line == 'FrontendEndpoint: \n':
        flag = 1
        new_file_str += """FrontendEndpoint:
  Host: "localhost"
  Port: 9509\n"""
        continue
    if flag:
        if line[0] != ' ':
            flag = 0
    if not flag:
        new_file_str += "".join(line)

f = open(fpath,'w')
f.write(new_file_str)
f.close()
