#!/bin/sh

SRC_DIR="$(realpath -- "$(dirname -- "$0")")"


# In POSIX comliant script is '.' equivlant to the 'source' command
# However if using bash or zsh 'source' may be used.
. "${SRC_DIR}/colors"



print "--- ${T_BOLD}Formatting${TR} ---"

print "${T_BOLD}BOLD${TR} reset"
print "${T_DIM}DIM${TR} reset"
print "${T_UNDERLINE}UNDERLINE${TR} reset"
print "${T_BLINK}BLINK${TR} reset"
print "${T_REVERSE}REVERSE${TR} reset"
print "${T_HIDDEN}HIDDEN${TR} reset"


print "\n\n--- ${T_BOLD}Colors${TR} ---"

print "${TF_BLACK}black${TR}\t\treset"
print "${TF_RED}red${TR}\t\treset"
print "${TF_GREEN}green${TR}\t\treset"
print "${TF_YELLOW}yellow${TR}\t\treset"
print "${TF_BLUE}blue${TR}\t\treset"
print "${TF_MAGENTA}magenta${TR}\t\treset"
print "${TF_CYAN}cyan${TR}\t\treset"
print "${TF_LIGHT_GRAY}light_gray${TR}\treset"
print "${TF_DARK_GRAY}dark_gray${TR}\treset"
print "${TF_LIGHT_RED}light_red${TR}\treset"
print "${TF_LIGHT_GREEN}light_green${TR}\treset"
print "${TF_LIGHT_YELLOW}light_yellow${TR}\treset"
print "${TF_LIGHT_BLUE}light_blue${TR}\treset"
print "${TF_LIGHT_MAGENTA}light_magenta${TR}\treset"
print "${TF_LIGHT_CYAN}light_cyan${TR}\treset"
print "${TF_WHITE}white${TR}\t\treset"


print "\n\n--- ${T_BOLD}Background${TR} ---"

print "${TB_BLACK}black${TR}\t\treset"
print "${TB_RED}red${TR}\t\treset"
print "${TB_GREEN}green${TR}\t\treset"
print "${TB_YELLOW}yellow${TR}\t\treset"
print "${TB_BLUE}blue${TR}\t\treset"
print "${TB_MAGENTA}magenta${TR}\t\treset"
print "${TB_CYAN}cyan${TR}\t\treset"
print "${TB_LIGHT_GRAY}light_gray${TR}\treset"
print "${TB_DARK_GRAY}dark_gray${TR}\treset"
print "${TB_LIGHT_RED}light_red${TR}\treset"
print "${TB_LIGHT_GREEN}light_green${TR}\treset"
print "${TB_LIGHT_YELLOW}light_yellow${TR}\treset"
print "${TB_LIGHT_BLUE}light_blue${TR}\treset"
print "${TB_LIGHT_MAGENTA}light_magenta${TR}\treset"
print "${TB_LIGHT_CYAN}light_cyan${TR}\treset"
print "${TB_WHITE}white${TR}\t\treset"


print "\n\n--- ${T_BOLD}Combinations${TR} ---"
print "${T_BOLD}${TF_RED}Bold red${TR}"
print "${T_DIM}${TF_GREEN}Dim green${TR}"
print "${T_UNDERLINE}${TF_YELLOW}Underline yellow${TR}"
print "${T_BLINK}${TF_MAGENTA}Blink magenta${TR}"
print "${T_REVERSE}${TF_CYAN}Reverse cyan${TR}"
print "${TB_LIGHT_GRAY}${TF_BLUE}BLue on light_gray${TR}"
