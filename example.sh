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
	printf "${T_REVERSE}$(t_color fg $i)color_%03d${TR}" "$i"
	if [ "$i" = 7 ]; then
		printf "\n";
	elif [ "$i" = 15 ]; then
		printf "\n\n";
	elif [ "$i" -gt 15 ] && [ $(((i - 15) % 6))  = 0 ]; then
		printf "\n";
	else
		printf " "
	fi
	i="$((i+1))"
done




_print_test_block() {
	printf "%b" "$(t_rgb bg "$1" "$2" "$3") "
}



print "\n\n--- ${T_BOLD}24 BIT TRUE COLOR TEST${TR} ----"
# Inspired by https://unix.stackexchange.com/a/404415
COLUMNS="$(stty size | awk '{print $2}' || echo 80)"
print_rgb_gradient() {
	_MAX_VALUE="${1:-"255"}"
	i=0
	while [ "$i" -lt "$COLUMNS" ]; do
		v=$((i * _MAX_VALUE / COLUMNS))
		r=$((_MAX_VALUE - v));
		g=$((2*v));
		b=$((v));
		if [ "$g" -gt "$_MAX_VALUE" ]; then g=$((_MAX_VALUE * 2 - g)); fi
		_print_test_block "$r" "$g" "$b"
		i="$((i+1))"
	done
	print
}
print_rgb_gradient

print_line() {
	_MAX_VALUE="${4:-"255"}"
	x=0
	while [ "$x" -lt "$COLUMNS" ]; do
		# shellcheck disable=SC2034
		v=$((x*_MAX_VALUE/COLUMNS))
		r=$(($1));
		g=$(($2));
		b=$(($3));
		_print_test_block "$r" "$g" "$b"
		x="$((x+1))"
	done
	print
}

# Alternative RGB gradient printing
print_line "_MAX_VALUE - v" "( ( (v*2) > _MAX_VALUE ) ? _MAX_VALUE - v : v ) * 2" "v"

# Grayscale
print_line "v" "v" "v"

# Individual RGB gradients
print_line "v" "0" "0"
print_line "0" "v" "0"
print_line "0" "0" "v"


# ROWS="$(stty size | awk '{print $1}' || echo 50)"
# y=0
# while [ "$y" -lt "$ROWS" ]; do
# 	print_line "_MAX_VALUE - v" "( ( (v*2) > _MAX_VALUE ) ? _MAX_VALUE - v : v ) * 2" "v" "$((255 - 255/ROWS*y))"
# 	y="$((y+1))"
# done
