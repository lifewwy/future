import sys
def readLines(fname):
    try:
        f=open(fname,'r')
        li=f.read().splitlines()
        cell='{'+repr(li)[1:-1]+'}'
        f.close()
        print(cell)
    except IOError:
        print("Can't open file "+fname)
if '__main__'==__name__:
    if len(sys.argv)<2:
        print('No file specified.')
        sys.exit()
    else:
        readLines(sys.argv[1])
