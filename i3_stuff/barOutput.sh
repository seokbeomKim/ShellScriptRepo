#!/bin/bash
numberOfWorkspaces=7;
workspaces[0]="1:web"
workspaces[1]="2:dev-1"
workspaces[2]="3:dev-2"
workspaces[3]="4:media"
workspaces[4]="5:doc"
workspaces[5]="6:chat"
workspaces[6]="7:pim"

while true; do
    currentNum=$(/home/chaoxifer/.i3/currentWorkspaceNum.py)
    index=1
    while [ $index -le 7 ]; do
	if [ $index == $currentNum ]; then
	    echo -n " ^fg(#6DBCDB)${workspaces[$index-1]}^fg() ";
	else
	    echo -n " ^fg(#FFFFFF)${workspaces[$index-1]}^fg() ";
	fi
	let index=$index+1
    done
    echo "";
    cat /home/chaoxifer/barfifo >/dev/null;
done
