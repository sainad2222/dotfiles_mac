import os
fpath = input("give file path(root=protos/api)\n")
home_folder = os.getenv("HOME") or "/Users/sainath"
fpath = home_folder+'/go/src/github.com/epifi/protos/api/'+fpath
f = open(fpath,'r')
lines = f.readlines()
f.close()

new_file_str = ""
def check(line):
    return '[(validate.rules).enum' in line and 'in' in line

def process(line):
    line = line.split("[")[0]
    line += ';'
    return line

for line in lines:
    if check(line):
        new_file_str += "".join(process(line))
    else:
        new_file_str += "".join(line)

f = open(fpath,'w')
f.write(new_file_str)
f.close()
