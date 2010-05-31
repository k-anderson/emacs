all:
	gcc main.cc -o main

# this target is used by emacs flymake.
# you may change it but be careful.
check-syntax:
	gcc -Wall -o /dev/null -I. -S ${CHK_SOURCES}
