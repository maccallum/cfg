#!/bin/bash

cd $HOME/org
homedir=$HOME
name="org"

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

p=1
screen -S "$name" -p 0 -X screen -fa -t Notes
screen -S "$name" -p "$p" -X stuff 'emacs notes.org\n'

p=2
screen -S "$name" -p 0 -X screen -fa -t 'Stickies'
screen -S "$name" -p "$p" -X stuff 'emacs stickies.org\n'

p=3
screen -S "$name" -p 0 -X screen -fa -t 'OSE Journal'
screen -S "$name" -p "$p" -X stuff 'emacs ose_journal.org\n'

p=4
screen -S "$name" -p 0 -X screen -fa -t 'Archives'
screen -S "$name" -p "$p" -X stuff 'emacs notes.org_archive ose_journal.org_archive\n'

screen -fa -aAx "$name"
