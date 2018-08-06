comm -i <(sort -i sourceFile.csv) <(sort -i destinationFile.csv)
#Use command given below to change default sort cmd working folder to current folder for hught files
sort -T . sourceFile.csv > sourceFileSort.csv
