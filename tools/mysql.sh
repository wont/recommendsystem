#!/bin/bash
if [ -z $1 ];then
   echo 'USAGE:CONTENTTITLEAND FILENAME'
   exit 0
fi
filename=result
echo "">$filename
URL=(`sed -n 's/.*>\(.*\)<\/url>/\1/p' $1`)
DOCNO=(`sed -n 's/.*>\(.*\)<\/docno>/\1/p' $1`)
CONTENTTITLE=(`sed -n 's/.*>\(.*\)<\/contenttitle>/\1/p' $1`)
CONTENT=(`sed -n 's/.*>\(.*\)<\/content>/\1/p' $1`)
FILE=(`ls -l $filename >/dev/null 2>&1 | awk '{print $8}'`)
if [ ! -z $FILE ];then
#echo -e "host\t\toidgroupname\t\tcomm\t\tdesc" >$filename
DD=""
fi
for((i=0;i<${#URL[@]};i++));do
#echo -e "${URL[i]}\t${DOCNO[i]}\t${CONTENTTITLE[i]}\t\t${CONTENT[i]}" >>$filename
echo "insert into news (url,docno,contenttitle,content)values('${URL[i]}','${DOCNO[i]}','${CONTENTTITLE[i]}','${CONTENT[i]}');" >>$filename
done
