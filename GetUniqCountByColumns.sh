#Run this file by passing filename to the script file
fileName=tempFile_$1
echo "Total entries in the file"
wc -l $1
echo "Summary - count of unique Col1"
sed '1,3d' $1 | sed '$d' | sed '$d' > $fileName
awk -F"|" '{print $1}' $fileName | sort | uniq -c
awk -F"|" '{gsub(/ /,"",$1);gsub(/^[ ]+/,"|",$2); print $1,$2}' tempFile_$1 | sort > tempFile_Col2_$1
uniq -c tempFile_Col2_$1 | sed -r 's/^ *//;s/([0-9]) /\1|/g;' > tempFile_Col2_Count_$1
sort -k1,1nr tempFile_Col2_Count_$1 > Operations_Count_$1
uniq tempFile_Col2_$1 > Unique_Col2_$1
echo "Summary - count of unique Col2"
wc -l Unique_Col2_$1
echo "Col2 Count file: Col2_Count_$1"
rm tempFile*
