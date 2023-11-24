#!/bin/sh
set -eu

SRC_DIR="$(realpath "$(dirname -- "$0")")"


# In POSIX comliant script is '.' equivlant to the 'source' command
# However if using bash or zsh 'source' may be used.
. "${SRC_DIR}/colors"



print "--- ${T_BOLD}Formatting${TR} ---"

print "${T_BOLD}BOLD${TR}               ${T_BLINK}BLINK${TR}"
print "${T_DIM}DIM${TR}                ${T_REVERSE}REVERSE${TR}"
print "${T_ITALIC}ITALIC${TR}             ${T_HIDDEN}HIDDEN${TR}"
print "${T_UNDERLINE}UNDERLINE${TR}          ${T_STRIKE}STRIKE${TR}"



print "\n\n--- ${T_BOLD}Colors${TR} ---"

print "${TF_BLACK}black${TR}              ${TF_DARK_GRAY}dark_gray${TR}"
print "${TF_RED}red${TR}                ${TF_BRIGHT_RED}bright_red${TR}"
print "${TF_GREEN}green${TR}              ${TF_BRIGHT_GREEN}bright_green${TR}"
print "${TF_YELLOW}yellow${TR}             ${TF_BRIGHT_YELLOW}bright_yellow${TR}"
print "${TF_BLUE}blue${TR}               ${TF_BRIGHT_BLUE}bright_blue${TR}"
print "${TF_MAGENTA}magenta${TR}            ${TF_BRIGHT_MAGENTA}bright_magenta${TR}"
print "${TF_CYAN}cyan${TR}               ${TF_BRIGHT_CYAN}bright_cyan${TR}"
print "${TF_BRIGHT_GRAY}bright_gray${TR}        ${TF_WHITE}white${TR}"



print "\n\n--- ${T_BOLD}Background${TR} ---"

print "${TF_WHITE}${TB_BLACK}black${TR}              ${TF_BLACK}${TB_DARK_GRAY}dark_gray${TR}"
print "${TF_BLACK}${TB_RED}red${TR}                ${TF_BLACK}${TB_BRIGHT_RED}bright_red${TR}"
print "${TF_BLACK}${TB_GREEN}green${TR}              ${TF_BLACK}${TB_BRIGHT_GREEN}bright_green${TR}"
print "${TF_BLACK}${TB_YELLOW}yellow${TR}             ${TF_BLACK}${TB_BRIGHT_YELLOW}bright_yellow${TR}"
print "${TF_BLACK}${TB_BLUE}blue${TR}               ${TF_BLACK}${TB_BRIGHT_BLUE}bright_blue${TR}"
print "${TF_BLACK}${TB_MAGENTA}magenta${TR}            ${TF_BLACK}${TB_BRIGHT_MAGENTA}bright_magenta${TR}"
print "${TF_BLACK}${TB_CYAN}cyan${TR}               ${TF_BLACK}${TB_BRIGHT_CYAN}bright_cyan${TR}"
print "${TF_BLACK}${TB_BRIGHT_GRAY}bright_gray${TR}        ${TF_BLACK}${TB_WHITE}white${TR}"



print "\n\n--- ${T_BOLD}Combinations${TR} ---"

print "${T_BOLD}${TF_RED}Bold red${TR}           ${T_BLINK}${TF_MAGENTA}Blink magenta${TR}"
print "${T_DIM}${TF_GREEN}Dim green${TR}          ${T_REVERSE}${TF_CYAN}Reverse cyan${TR}"
print "${T_UNDERLINE}${TF_YELLOW}Underline yellow${TR}   ${TB_BRIGHT_GRAY}${TF_BLUE}BLue on bright_gray${TR}"



print "\n\n--- ${T_BOLD}8 BIT COLOR TEST${TR} ----"
# Adapted from https://askubuntu.com/a/821163
i=0 
while [ "$i" -lt 256 ]; do
	printf "${T_REVERSE}$(t_color fg $i)color_%03d${TR} " "$i"
	if [ "$i" = 7 ]; then
		printf "\n";
	fi
	if [ "$i" = 15 ]; then
		printf "\n\n";
	fi
	if [ "$i" -gt 15 ] && [ $(((i - 15) % 6))  = 0 ]; then
		printf "\n";
	fi
	i="$((i+1))"
done



print "\n\n--- ${T_BOLD}24 BIT TRUE COLOR TEST${TR} ----"
# Inspired by https://unix.stackexchange.com/a/404415
COLUMNS="$(stty size | awk '{print $2}' || echo 80)"
i=0
while [ "$i" -lt "$COLUMNS" ]; do
	r=$((255-(i*255/COLUMNS)));
	g=$((i*510/COLUMNS));
	b=$((i*255/COLUMNS));
	if [ "$g" -gt 255 ]; then g=$((510-g)); fi
	printf "%b" "$(t_rgb bg "$r" "$g" "$b") "
	i="$((i+1))"
done
print
print
i=0
while [ "$i" -lt "$COLUMNS" ]; do
	r=$((i*255/COLUMNS));
	g=$((i*255/COLUMNS));
	b=$((i*255/COLUMNS));
	printf "%b" "$(t_rgb bg "$r" "$g" "$b") "
	i="$((i+1))"
done
print
i=0
while [ "$i" -lt "$COLUMNS" ]; do
	r=$((i*255/COLUMNS));
	g=0
	b=0
	printf "%b" "$(t_rgb bg "$r" "$g" "$b") "
	i="$((i+1))"
done
print
i=0
while [ "$i" -lt "$COLUMNS" ]; do
	r=0
	g=$((i*255/COLUMNS));
	b=0
	printf "%b" "$(t_rgb bg "$r" "$g" "$b") "
	i="$((i+1))"
done
print
i=0
while [ "$i" -lt "$COLUMNS" ]; do
	r=0
	g=0
	b=$((i*255/COLUMNS));
	printf "%b" "$(t_rgb bg "$r" "$g" "$b") "
	i="$((i+1))"
done
print
