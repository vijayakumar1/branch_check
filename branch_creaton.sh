#!/bin/sh
# this is for directory structure if you want use other wise leave it
#mkdir $1 && cd $1 && mkdir $2 && cd $2 && mkdir $3 && cd $3
read -p 'enter number of branches:' num
c=1
while [ $c -le $num ]
do
        read -p "enter the url:" url
        read -p "enter branch name:" branch
        git clone $url
        OUTPUT=$(ls -t1 |  head -n 1) && dir="${OUTPUT}"
        echo $dir
        #dir=ls| awk '{print}'
        #dir=${PWD##*/}
        cd $dir
        file=$(ls) 
        f2="${file}"
        echo $f2
        pjt=`git branch -r` 
        echo $pjt
        ob=`git branch -r|tail -1| head -1|sed 's/origin\///'|tr -d ' '`
        git checkout -b $ob
	files=$(ls)
      	echo $files
        git checkout -b $branch
        git push origin $branch
        echo "--------------Branch created from $ob branch-----------------"
c=`expr $c + 1`
done
