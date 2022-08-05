#!/bin/bash
IFS=$'\n'   




VideoFiles=$(find ./ -maxdepth 10 -regex ".*\.\(mkv\|mp4\|wmv\|flv\|webm\|mov\|avi\|m4v\)")  

for i in $VideoFiles  
do  
  filename=$(basename "$i");
  extension="${filename##*.}";
  filename="${filename%.*}";


    eval $(ffprobe -v quiet -show_format -of flat=s=_ -show_entries stream=height,width,nb_frames,duration,codec_name -sexagesimal "$i");
    codec=${streams_stream_1_codec_name};
    
    d=$(dirname "$i")
echo -e "{$codec}\n";

done  