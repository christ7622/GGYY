
target  prerequisites
  ↘       ↘
hello: hello.c
    gcc -o hello hello.c
            ↗
          recipe
--------------------------------------

$@: target name
$^: all of prerequisites
        ↓1        ↓2
    $(TARGET): $(SRCS)
        $(CC) -o $@ $(CFLAGS) $^
                  ↑1           ↑2
$<: first of prerequisite
              ↓
    target: dep1.c dep1.h test.h
        gcc -o $@ $<
                   ↑
$?: the prerequisites which newer then target
$!: shows last process ID which has started in background.
--------------------------------------

VAR1 =  VAR2 (assign address)
VAR1 := VAR2 (assign value)
VAR1 ?= VAR2 (if assigned value, will not accept another value assign)
VAR1 += VAR2 (append value)

look more: http://elinux.org/Bitbake_Cheat_Sheet
--------------------------------------

$(warning This is GG)
$(error This is GG)
$(subset from,to,$(SRC))        // for replace
    ex: $(warning $(subst .c,.o,test.c hello.c))
$(patsubst from,to,$(SRC))      // for pattern
    ex: $(warning $(patsubst t%.c,c%.o,test.c hello.c))
$(shell COMMAND)
    ex: $(warning $(shell pwd))
    
EX: OBJS=$(patsubst %.c,%.o,$(shell ls *.c))   // $(warning $(patsubst %.c,%.o,$(shell ls *.c)))

get all *.c list
$(wildcard *.c)
    ex:$(patsubst %.c,%.o,$(wildcard *.c))
--------------------------------------

autoscan
configure.scan -> configure.ac
aclocal
autoconf
autoheader
automake --add-missing
./configure --prefix=`pwd`/bin
make
