cd $HOME
name="vms"
jump="nuc1"
all=false
vms=("$@")

while getopts ":ahj:" options; do
    case "${options}" in
        a)
            all=true
            ;;
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

# echo "all => $all"
if [ "$all" = true ] ; then
    vms=( $(virsh -c "qemu+ssh://${jump}.local/system" list --all | grep -E '^ ([[:digit:]]|-)' | awk '{print $2}') )
fi
# echo "vms => $vms"
# echo "args => $@"

screen -S "$name" -d -m

screen -S "$name" -p 0 -X screen -fa -t "virsh"
screen -S "$name" -p "virsh" -X stuff "virsh -c qemu+ssh://${jump}.local/system\n"

screen -S "$name" -p 0 -X screen -fa -t "$jump"
screen -S "$name" -p "$jump" -X stuff "ssh ${jump}.local\n"

for vm in "$jump" "${vms[@]}"; do
    if [ "$vm" != "$jump" ]; then
        screen -S "$name" -p 0 -X screen -fa -t "$vm"
    	screen -S "$name" -p "$vm" -X stuff "ssh -J ${jump}.local ${vm}.local\n"
    fi
done

screen -fa -aAx "$name"
