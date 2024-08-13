#!/bin/bash

cd $HOME/Development/Cycling74
homedir=$HOME
name="c74"

while getopts ":hmn:optzd" options; do
    case "${options}" in
	# h)
	#     usage
	#     exit 0
	#     ;;
	n)
	    name=${OPTARG}
	    ;;
	\?)
	    # usage
	    exit 1
	    ;;
    esac
done
shift $((OPTIND - 1))

screen -S "$name" -d -m

screen -S "$name" -p 0 -X screen -fa -t master //group # 1

screen -S "$name" -X eval 'chdir max'
screen -S "$name" -p 1 -X screen -fa -t "master::code"
screen -S "$name" -p 1 -X screen -fa -t "master::build"
screen -S "$name" -p 1 -X screen -fa -t "master::debug"

cd max-worktrees
wtdir=`pwd`
for wt in `ls`
do
    screen -S "$name" -X eval "chdir ${wtdir}/${wt}"
    screen -S "$name" -p 0 -X screen -fa -t "$wt" //group
    screen -S "$name" -p "$wt" -X screen -fa -t "${wt}::code"
    screen -S "$name" -p "$wt" -X screen -fa -t "${wt}::build"
    screen -S "$name" -p "$wt" -X screen -fa -t "${wt}::debug"
done

screen -S "$name" -X eval "chdir $HOME/Development/Ableton/live"
screen -S "$name" -p 0 -X screen -fa -t "live" //group
screen -S "$name" -p "live" -X screen -fa -t "live::code"
screen -S "$name" -p "live" -X screen -fa -t "live::build"
screen -S "$name" -p "live" -X screen -fa -t "live::debug"

screen -fa -aAx "$name"
