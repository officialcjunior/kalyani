printf "\nKalyani- a display brightness controller program\n"

printf "Use \`f\`,\`j\` (+- 0.1) and \`d\`,\`k\` (+-0.05) to control the brightness\nPress \`q\` when you're finished. \n\n"

display_name=$(xrandr | grep " connected" | cut -d" " -f1)

echo -n "Currently connected display: "
echo $display_name

i=0
# Fight me
while [ $i -le 0 ]
do
	curr_brightness=$(xrandr --verbose --current | grep -i brightness | cut -d" " -f2)
	echo -n "Current brightness level = "
	echo $curr_brightness

	read -n 1 -s input
	if [ "$input" = "f" ]; then
		x=`echo "$curr_brightness+0.1" | bc | awk '{ printf("%.1f\n",$1) '}`
		xrandr --output "$display_name" --brightness "$x"
	elif [ "$input" = "j" ]; then
		x=`echo "$curr_brightness-0.1" | bc | awk '{ printf("%.1f\n",$1) '}`
		xrandr --output "$display_name" --brightness "$x"
	elif [ "$input" = "d" ]; then
		x=`echo "$curr_brightness+0.05" | bc | awk '{ printf("%.3f\n",$1) '}`
		xrandr --output "$display_name" --brightness "$x"
	elif [ "$input" = "k" ]; then
		x=`echo "$curr_brightness-0.05" | bc | awk '{ printf("%.3f\n",$1) '}`
		xrandr --output "$display_name" --brightness "$x"
	elif [ "$input" = "q" ]; then
		printf "\nLooking great, man. Glad to be of service."
		exit
	fi
done
