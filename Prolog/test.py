#!/usr/bin/env python3

import subprocess as sub
import sys

if len(sys.argv) != 2:
    print("Usage python test N \nExample python test 10")
    exit()

path = sys.argv[0][:0-len("test.py")]

#generate labyrinths
for i in range(int(sys.argv[1])):
    print("Generating esempio"+str(i)+"a ...")
    sub.run(["./"+path+"data/generator.py", "esempio"+str(i)+"a", "10"])
    print("Translating esempio"+str(i)+"a ...")
    sub.run(["./"+path+"data/translator.py", "esempio"+str(i)+"a"])

#start test
for i in range(int(sys.argv[1])):
    print("Starting ida star on esempio"+str(i)+"a ...")
    sub.run(["./"+path+"ida_star/load.py", "esempio"+str(i)+"a", "30"])
    print("Starting iterative deepening on esempio"+str(i)+"a ...")
    sub.run(["./"+path+"iterative_deepening/load.py", "esempio"+str(i)+"a", "30"])
    print("Starting a star on esempio"+str(i)+"a ...")
    sub.run(["./"+path+"a_star/load.py", "esempio"+str(i)+"a", "30"])