cd $HOME/Development/0Z3
homedir=$HOME

screen -S o.se -d -m

screen -S o.se -p 0 -X screen -fa -t o.se //group # 1
screen -S o.se -p 0 -X screen -fa -t max.o.se //group # 2
screen -S o.se -p 0 -X screen -fa -t MicrOSCript //group # 3
screen -S o.se -p 0 -X screen -fa -t Unreal //group # 4

screen -S o.se -X eval 'chdir o.se'
screen -S o.se -p 1 -X screen -fa -t code
screen -S o.se -p 1 -X screen -fa -t build
screen -S o.se -p 1 -X screen -fa -t debug

screen -S o.se -X eval 'chdir ../max.o.se'
screen -S o.se -p 2 -X screen -fa -t code
screen -S o.se -p 2 -X screen -fa -t build
screen -S o.se -p 2 -X screen -fa -t debug

screen -S o.se -X eval "chdir ${homedir}/Documents/Arduino/libraries/MicrOSCript"
screen -S o.se -p 3 -X screen -fa -t code
screen -S o.se -p 3 -X screen -fa

screen -S o.se -X eval "chdir ${homedir}/Documents/'Unreal Projects'"
screen -S o.se -p 4 -X screen -fa -t code
screen -S o.se -p 4 -X screen -fa

screen -fa -aAx o.se
