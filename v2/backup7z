#!/bin/bash

function usage {
    echo "
    The only options are a and x, for archive and extract.
    use as (commmand option directory) to apply to that directory.
    "
}



if [ $1 = 'a' ]
then
    starttime=$(date '+%m:%d:%Y-%H:%M:%S')
    name=$(echo $2 | sed 's/\///')
    tar cf bak.$name.$starttime.tar $2
    7za a bak.$name.$starttime.tar.7z bak.$name.$starttime.tar
    rm bak.$name.$starttime.tar
else
if [ $1 = 'x' ] 
then
    if [ $2 =~ ".tar.7z" ]
    then
        usage
        exit
    fi
    7za x $2
    ret=$(echo $2 | sed s/\.7z//)
    tar xf $ret
    rm $ret
else
    usage
    exit
fi
fi
