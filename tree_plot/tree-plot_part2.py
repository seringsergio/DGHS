# this program will try to close a image viewer window every ten secounds
# python tree-plot_part1.py 7 & python tree-plot_part2.py

import os
import time

# creating a forever loop
while 1 :
    os.system("kill -9 $(pidof eog)")
    time.sleep(1)
