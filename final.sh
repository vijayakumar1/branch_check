# this is for directory structure if you want use other wise leave it
#mkdir $1 && cd $1 && mkdir $2 && cd $2 && mkdir $3 && cd $3
echo "enter number of branche"
read num
count=1
until [$count -gt $num]
do
echo "enter the url:\c" 
read url
echo "enter branch name:\c"
read branch
rm -rf .
git clone $url
OUTPUT=$(ls) && dir="${OUTPUT}"
echo $dir
#dir=ls| awk '{print}'
#dir=${PWD##*/}
cd $dir
file=$(ls) && f2="${file}"
echo $f2
pjt= git branch -r
#if [pjt]
if [ -z $pjt ]
then
touch README.md
git add README.md
git commit -m "add README.md"
git push origin master
git checkout -b $branch
git push origin $branch
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "-----------------------new branch created-------------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
else
ob=git branch -r|sed -n '2p'|sed 's/origin\///'|tr -d ' '
git checkout -b $ob
git checkout -b $branch
git push origin $branch
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
echo "--------------branchcreated from existing branch------------------"
echo "------------------------------------------------------------------"
echo "------------------------------------------------------------------"
fi
done
