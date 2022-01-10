#!/bin/bash

files=("$(pwd)/screens/*")
randomfile="$(ls $files | shuf -n1)"

cp $randomfile /tmp/lock.png
convert /tmp/lock.png /tmp/lock.jpg
file=/tmp/lock.jpg

newFile=/tmp/glitch_lock.jpg
cat $file > $newFile

function glitch() {
	fileSize=$(wc -c < "$file");
	headerSize=1000;
	skip=$(shuf -i "$headerSize"-"$fileSize" -n 1);
	count=$(shuf -i 1-10 -n 1);
	for i in $(seq 1 $count);do byteStr=$byteStr'\x'$(shuf -i 0-254 -n 1); done;
	echo $byteStr' @ '$skip;
	printf $byteStr | dd of="$newFile" bs=1 seek=$skip count=$count conv=notrunc
}

steps=$(shuf -i 30-60 -n 1);
for i in $(seq 1 $steps);
do
	byteStr='';
	glitch "$file";
done

PARAM=(--bar-indicator --bar-position h --bar-direction 1 --redraw-thread -t "" \
	--bar-step 50 --bar-width 250 --bar-base-width 50 --bar-max-height 100 --bar-periodic-step 50 \
	--bar-color 00000077 --keyhlcolor 00666666 --ringvercolor cc87875f --wrongcolor ffff0000 \
	--veriftext="" --wrongtext="" --noinputtext="" )
i3lock -n "${PARAM[@]}" -i "$newFile" > /dev/null 2>&1


