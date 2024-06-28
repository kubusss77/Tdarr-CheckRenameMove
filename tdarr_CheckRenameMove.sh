#!/bin/sh

# (c) 2024 Jakub Szczepa


working_file="$(basename "$2")"
working_folder="$(dirname "$2")"

if echo "$working_file" | grep -q "2160p"; then
	target_file="$(echo $working_file | sed 's/ - Org-/ - Web-/' | sed 's/2160p/1080p/')"
else
	target_file="$(echo $working_file | sed 's/ - Org-/ - Web-/')"
fi


target_folder="/mnt/Multimedia/FilmyWeb/$(echo $working_file | sed 's/ - Org-.*//')"


if [ "$1" -eq 1 ]; then
	if [ -e "$target_folder/$target_file" ]; then
		exit 1
	else
		exit 0
	fi
fi

#echo "wfile: $working_file" >> /tmp/tmp.txt
#echo "tfile: $target_file" >> /tmp/tmp.txt
#echo "tfolder: $target_folder" >> /tmp/tmp.txt

if [ "$1" -eq 2 ]; then
	if [ -e "$target_folder/$target_file" ]; then
		exit 2
	else
		mkdir "$target_folder"
		mv "$working_folder/$working_file" "$target_folder/$target_file"
		exit 0
	fi
fi

exit 3
