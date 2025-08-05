
#!/bin/bash

#create the root dir that will contain all the dir and files
mkdir -p root

# takes repo_name as parameter which is the dir that's created with the first script creation_script.sh
repo_name=$1

# then we'll browse all the .txt files in this rep
for name in $repo_name/*.txt; do

	# extract prefix and date data 
	name_without_ext="${name%.*}"
	filename=$(basename "$name_without_ext")
    	IFS='_' read -ra prefix_date <<< "$filename"
	
	# get the (year, month, day, hour) from the date and create the dir for each one
	prefix=${prefix_date[0]}
	
	mkdir -p "root/$repo_name/$prefix"
    	IFS='-' read -ra all_date <<< "${prefix_date[1]}"
    	
	year=${all_date[0]}
	mkdir -p "root/$repo_name/$prefix/$year"
	
	month=${all_date[1]}
	mkdir -p "root/$repo_name/$prefix/$year/$month"
	
	day=${all_date[2]}
	mkdir -p "root/$repo_name/$prefix/$year/$month/$day"
	
	hour=${all_date[3]}
	mkdir -p "root/$repo_name/$prefix/$year/$month/$day/$hour"
	
	# create the file MinuteSecondMillisecond that will be filled with file previous location and name
	minute=${all_date[4]}
	second=${all_date[5]}
	millisecond=${all_date[6]}
	MinuteSecondMillisecond="${minute}${second}${millisecond}.dat"
	file_path="root/$repo_name/$prefix/$year/$month/$day/$hour/$MinuteSecondMillisecond"
	touch "$file_path"
	# Write data to the file
	echo "Previous file name: ${prefix_date[1]}" > "$file_path"
	# Append additional data to the file
	echo "Previous file location: $name" >> "$file_path"
	echo "Name of the script that created this file: reorganization_script" >> "$file_path"

done 







