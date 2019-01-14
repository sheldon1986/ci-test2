#!/bin/bash
LIST=`cat $1 | grep -v ^#`
for list in ${LIST[*]}
       do
	       git branch $list
               git checkout $list
               git pull origin master
done
