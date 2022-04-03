#!/bin/bash

## Check if binaries are already installed
cd ~
export PATH=$PATH:~/dogecoin-bin/bin/
##Check if configuration file exists
if [ ! -f ~/.dogecoin/dogecoin.conf ]; then
    mkdir ~/.dogecoin
    echo rpcuser=dogecoinrpc > ~/.dogecoin/dogecoin.conf
    PWord=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1`
    echo rpcpassword=$PWord >> ~/.dogecoin/dogecoin.conf
fi

##Remove bootstrap.dat.old if it exists
if [ -f ~/.dogecoin/bootstrap.dat.old ]; then
    rm ~/.dogecoin/bootstrap.dat.old
fi

##Start dogecoind daemon
echo Running dogecoin

~/dogecoin-bin/bin/dogecoind -maxconnections=500 -printtoconsole -shrinkdebugfile &

if [ "$NODES" != "null" ]; then
    echo "NODES $NODES"
    IFS=' ' read -ra dogenodes <<< $NODES
    for i in "${dogenodes[@]}"
    do
        echo "Adding Node $i"
        sleep 15
        ~/dogecoin-bin/bin/dogecoin-cli addnode $i add
    done
fi

wait -n