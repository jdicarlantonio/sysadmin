#!/bin/bash

# i think this just needs a grep command
# -i ignores cases, -r is recursive and -w matches the whole word
# from there we can just count the lines of the grep command
# grep -i --include=\*.h -rw '/usr/src/kernels' -e 'magic' | wc -l

# this command works as well, however i dont know which one to trust
# the curly braces are needed to use the current file we are on
find /usr/src/kernels/ -name '*.h' -exec grep -i 'magic' {} \; | wc -l
