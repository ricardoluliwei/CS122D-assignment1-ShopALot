#!/bin/bash


if [[ $# != 0] && [$1 == "clean" ]]
then 
    rm -rf Output
    exit
fi

if [[ $# != 0] && [$1 == "init" ]]
then 
    psql shopalot -h localhost -f create_database.sql
    exit
fi

if [[ $# != 0] && [$1 == "load" ]]
then 
    psql shopalot -h localhost -f load_table.sql
    exit
fi

if [ $# != 0 ]
then 
    psql shopalot -h localhost -f $1
    exit
fi

if [ ! -d Output ]
then 
    mkdir Output
fi

for i in A B C D E F G H I J K L M
do
    psql shopalot -h localhost -f "$i.sql" > "Output/($i)Output.txt"
done

