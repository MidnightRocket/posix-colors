# posix-colors
Colors for POSIX compliant shell scripts without any dependencies or fuss. 
Because it is POSIX compliant, all the shells are supported. E.g. Bash, Zsh, SH, Ksh and Dash.

Basic formatting such as bold and underline is also supported!


The script automatically disables colors when output is NOT a terminal. 
E.g. when outputting to a file no weird escape sequences (`\033[3m`) is included. 
Conversely when outputting to the terminal, all those beautiful colors shine through! 
However this behaviour can be customised. [See below](#controlling-auto-coloring)


# How to use
> [!TIP]
> See [example.sh](example.sh) for how to use. 

You can either simply copy the contents of [colors](colors#L9-L59) into your script.
Or you can download this repo and source the file like so:
```sh
. /path/to/colors
```

Or for bash and zsh you alternatively use:
```bash
source /path/to/colors
```


## Controlling auto coloring

As mentioned above this script supports automatic coloring depend on whether or not output is a tty.  
This means when viewing output from the script directly colors will be displayed.  
But when redirecting to a file or piping to other programs the color escape codes are automatically disabled.
So you won't get those weird escape sequences. 

However if `FORCE_COLOR=true` is set in the environment before the script is run or sourced, 
then the color escape sequences are always used.
For instance seeing color with less:
```sh
FORCE_COLOR=true ./example.sh | less -R
```

Conversely can color output be completely disabled regardless of tty by setting `USE_COLOR=false`

```sh
USE_COLOR=false ./example.sh
```


# Resources
- [Stackoverflow: List of ANSI color Escape sequences](https://web.archive.org/web/20231123195802/https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences/33206814#33206814)
- [Bash tips: Colors and formatting](https://web.archive.org/web/20231123195802/https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences/33206814#33206814)
- [Shell command language#Parameter Expansion](https://web.archive.org/web/20231123113114/https://pubs.opengroup.org/onlinepubs/009695399/utilities/xcu_chap02.html#tag_02_06_02)
- [AskUbuntu Generate 8bit test pattern](https://web.archive.org/web/20231123230122/https://askubuntu.com/questions/821157/print-a-256-color-test-pattern-in-the-terminal/821163#821163)
- [Stackexchange Generate 24 bit test pattern](https://web.archive.org/web/20231123233540/https://unix.stackexchange.com/questions/404414/print-true-color-24-bit-test-pattern/404415#404415)
