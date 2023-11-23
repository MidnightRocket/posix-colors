#!/bin/sh
set -eu

SRC_DIR="$(realpath -- "$(dirname -- "$0")")"


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
