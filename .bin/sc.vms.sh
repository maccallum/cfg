cd $HOME
name="vms"
jump="nuc1"

while getopts ":hmj:optzd" options; do
    case "${options}" in
	# h)
	#     usage
	#     exit 0
	#     ;;
	j)
	    jump=${OPTARG}
	    ;;
	\?)
	    # usage
	    exit 1
	    ;;
    esac
done
shift $((OPTIND - 1))

screen -S "$name" -d -m

screen -S "$name" -p 0 -X screen -fa -t "$jump"
screen -S "$name" -p "$vm" -X stuff "ssh ${jump}.local\n"

for vm in "$jump" "$@"; do
    if [ "$vm" != "$jump" ]; then
        # screen -S "$name" -p "$vm" -X stuff "ssh ${vm}.local\n"
        #else
        screen -S "$name" -p 0 -X screen -fa -t "$vm"
    	screen -S "$name" -p "$vm" -X stuff "ssh -J ${jump}.local ${vm}.local\n"
    fi
done

screen -fa -aAx "$name"
