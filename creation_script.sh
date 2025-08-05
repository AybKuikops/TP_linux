
#!/bin/bash
# takes as parameter the repo_name that we want to give to the main folder and the prefix that will be used to name the file
repo_name=$1
prefix=$2

# create the repo_name dir with -p so it wont trigger a warning if the rep already exists
mkdir -p $repo_name

for num in {0..4}; do
	#get the infos from the date of today
	date_now=$(date)
	year=$(date +%Y)
	month=$(date +%m)
	day=$(date +%d)
	hour=$(date +%H)
	minute=$(date +%M)
	second=$(date +%S)
	millisecond=$(date +%3N)
	touch "$repo_name/${prefix}_$year-$month-$day-$hour-$minute-$second-$millisecond.txt"
	sleep 0.5
done
