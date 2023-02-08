####################################################
import sys
sys.path.append('..')
from assign02 import *
from assign02_01 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign02.sml)
#
####################################################
#def qsort(xs):
 #   if (mylist_nilq(xs)):
  #      return mylist_nil()
   # else:
    #    x1 = mylist_cons.get_cons1(xs)
     #   (ys, zs) = qpart(xs, x1)
        
def qsort(xs, p0):
    less = mylist_nil()
    greater = mylist_nil()
    xs = xs.get_cons2()
    while not mylist_nilq(xs):
        if (xs.get_cons1() > p0):
            greater = mylist_cons(xs.get_cons1(), greater)
        else:
            less = mylist_cons(xs.get_cons1(), less)
        xs = xs.get_cons2()
    return mylist_append(mylist_quicksort(less), mylist_cons(p0, mylist_quicksort(greater))) 



def mylist_quicksort(xs):
     if (mylist_nilq(xs)):
        return mylist_nil()
     else:
        x1 = xs.get_cons1()
        return qsort(xs,x1)
        
        
