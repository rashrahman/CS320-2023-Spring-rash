####################################################
import sys
sys.path.append('..')
from assign02 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_append (see list_append in assign02.sml)
# mylist_rappend (see list_rappend in assign02.sml)
# mylist_reverse (see list_reverse in assign02.sml)
#
####################################################

def mylist_append(xs, ys):
    if len(xs) == 0:
        return ys
    else:
        xs[0] + mylist_append(xs[1,len(xs)-1], ys)
