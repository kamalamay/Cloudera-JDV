#!/bin/bash

jboss_cli=~/local/runtimes/6-jdv/bin/jboss-cli.sh

if [[ -z "$1" || -z "$2" ]] ; then
    echo "usage: setup-ds.sh [add|rm] [all|module|driver|ds]"
    exit
fi

if [[ "$2" = "all" ]] ; then
    if [[ "$1" = "add" ]] ; then
	${jboss_cli} -c --file="cli/${1}-module.cli"
        ${jboss_cli} -c --file="cli/${1}-driver.cli"
        sleep 1
        ${jboss_cli} -c --file="cli/${1}-ds.cli"
    else
        ${jboss_cli} -c --file="cli/${1}-ds.cli"
        ${jboss_cli} -c --file="cli/${1}-driver.cli"
        sleep 1
        ${jboss_cli} -c --file="cli/${1}-module.cli"
    fi
    
else
    ${jboss_cli} -c --file="cli/${1}-${2}.cli"
fi
