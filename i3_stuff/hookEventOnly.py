#!/usr/bin/python
import i3
import time
import os

def print_event(event, data, subscription):
    os.system("echo received >> /home/chaoxifer/barfifo")
    subscription.close()
    i3.Subscription(print_event, 'workspace')

i3.Subscription(print_event, 'workspace')
