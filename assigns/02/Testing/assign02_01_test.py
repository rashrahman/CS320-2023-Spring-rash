####################################################
import sys
sys.path.append('../MySolution')
from assign02_01 import *
####################################################
print("[import ./../MySolution/assign02_01.py] is done!")
####################################################
xs = mylist_nil()
xs = mylist_cons(3, xs)
xs = mylist_cons(2, xs)
xs = mylist_cons(1, xs)
####################################################
assert(mylist_size(xs)==3)
####################################################
print("xs = ",end=''); mylist_print(xs); print();
####################################################
xs = mylist_append(xs, xs)
####################################################
print("xs = ",end=''); mylist_print(xs); print();
####################################################
xs = mylist_reverse(xs)
####################################################
print("xs = ",end=''); mylist_print(xs); print();
####################################################
xs = mylist_rappend(xs, xs)
####################################################
print("xs = ",end=''); mylist_print(xs); print();
####################################################
assert(mylist_size(xs) == 2*2*3)
####################################################
print("Assign02-01-test passed!\n")
####################################################

