---
title: "GNU Make"
author: mathieu.fourre
logo: https://www.epita.fr/wp-content/themes/epita-theme/assets/img/svg/EPITA\_LOGO\_INGENIEUR\_CMJN.svg
---

# Let's use Make

You have already use `make` this year but many of you haven't really understood
it's power.

# Why use Make

- flexible
- easy to use for c projects
- way better than and alias for gcc

# Goals

The goal is to make you confortable enough with make so that you can use it
during the piscine. As mentioned in the Editors page, the piscine is about
efficiency. Using (**and reusing**) a makefile is a good first step.

# Documentation

The official documentation is your best friend. It's very complete.

[click to see your best friend](https://www.gnu.org/software/make/manual/make.html)

# Why Make is not that easy to learn

The strength and weakness of `make` is that there are many implicite rules.

For example:
```makefile
OBJ = main.o func.o

main: main.o
    gcc main.o -o main

main.o: main.c
    gcc -c main.c -o main.o

func.o: func.c
    gcc -c func.c -o func.o
```
can be written:
```makefile
OBJ = main.o func.o

main: $(OBJ)
```

Here are some of the default rules (use `make -p` to see them all):
```makefile
# default
COMPILE.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c

OUTPUT_OPTION = -o $@

%.o: %.c
#  recipe to execute (built-in):
	$(COMPILE.c) $(OUTPUT_OPTION) $<

%: %.o
#  recipe to execute (built-in):
	$(LINK.o) $^ $(LOADLIBES) $(LDLIBS) -o $@
```

doc: [Implicit-Rules](https://www.gnu.org/software/make/manual/html_node/Implicit-Rules.html)

# Implicit variables

As you can see, these implicit rules use standardised variables.
You may change these variables.

For example, during `42sh`, you will use something like this.
```makefile
CC=gcc # explicitly set the c compiler
CFLAGS=-Wall -Werror -Wextra -pedantic -std=c99
```

These variables are very useful and flexible.

Here are some of these variables:
```make
CC= # c compiler
CFLAGS= # c flags
CPPFLAGS= # c pre-processor flags (ex: -D_GNU_SOURCE)
LDFLAGS= # linker flags
LDLIBS= # libraries (ex: -lm)
```

doc: [Implicit-Variables](https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html)

# Changing variables value only in specifc rules

Sometimes, you may want to change the value of a variable only for a rule.

To do this, you need to add a line just above the rule like so:
```makefile
rule_with_debug: CFLAGS += -g
rule_with_debug: file.o
```
doc: [appending more text to variables](https://ftp.gnu.org/old-gnu/Manuals/make-3.79.1/html_chapter/make_6.html#SEC65)

# Pattern rules

You can use `%` as a sort of wildcard.
For example, to define a rule that create a `.foo` from a `.bar` file with the same
name, you can do:
```makefile
%.foo: %.bar
    # do things
```

you can also set prefixes:
```makefile
folder1/%.foo: folder2/%.bar
    # do things
```
doc: [Pattern-Rules](https://www.gnu.org/software/make/manual/make.html#Pattern-Rules)

# Automatic variables
I you are following you may be wondering how you can write a rule while using
`%`. Indeed, this doesn't work:

```makefile
%.o: %.c
    gcc -c %.c -o %.o
```
To do this, you will have to use automatic variables.

- `$@` The file name of the target of the rule
- `$<` The name of the first prerequisite
- `$?` The names of all the prerequisites that are newer than the target
- `$^` The names of all the prerequisites
- `$*` The stem of an implicit rule

For example:

```makefile
all: file.o

%.o: %.c header.h
    echo $@ # file.o
    echo $< # file.c
    echo $^ # file.c header.h
    echo $* # file
```

doc: [Automatic-variables](https://www.gnu.org/software/make/manual/make.html#Automatic-Variables)

# Functions

Make comes with many functions. They can be used to define variables for example.

[Functions](https://www.gnu.org/software/make/manual/make.html#Functions)

To call a function do `$(function arguments)`.

Let's see some useful functions:
```makefile
ALL_FILES_IN_SRC = $(wildcard src/*)
ALL_DIRECTORIES_IN_SRC = $(dir $(wildcard src/*/)
ONLY_FOO = $(filter-out bar, foo bar)
BAR_FOO_LOSE = $(sort foo bar lose)
HELLO_I_AM_BOB = $(patsubst %jack, hello_%bob, i_am_jack)
PREFIXFOO = $(addprefix prefix, foo)
FOOSUFFIX = $(addsuffix suffic, foo)
```

# Exercice

Your goal is to prepare a makefile to help building a small project and it's
test-suite.

The test-suite uses `Criterion` which is a simple to use testing framework.
(I strongly encourage you to use it to test you piscine exercises)

The project tree looks like this:
```sh
$ tree make_exo
.
├── Makefile
├── src
│   ├── add
│   │   ├── add.c
│   │   └── add.h
│   ├── main.c
│   ├── main.o
│   ├── mul
│   │   ├── mul.c
│   │   └── mul.h
│   └── sub
│       ├── sub.c
│       └── sub.h
└── tests
    └── testfile.c

5 directories, 10 files
```

[skeleton](make_exo.tar.gz) (reminder: `tar -xvf make_exo.tar.gz` )

Your job is to write the Makefile for this project.
Try to make it as clean and generic as possible !

Here are the rule you will implement:
- release (the default target)
- debug
- test
- clean

Here are the outputs of the reference `Makefile`.
Use them as a guide on what to do and which flag to add for each rule:
```sh
$ make # release
gcc -Wall -Werror -Wextra -pedantic -std=c99 -Isrc/add/ -Isrc/mul/ -Isrc/sub/ -O2 -DNDBUG   -c -o src/prog.o src/prog.c
gcc -Wall -Werror -Wextra -pedantic -std=c99 -Isrc/add/ -Isrc/mul/ -Isrc/sub/ -O2 -DNDBUG   -c -o src/add/add.o src/add/add.c
gcc -Wall -Werror -Wextra -pedantic -std=c99 -Isrc/add/ -Isrc/mul/ -Isrc/sub/ -O2 -DNDBUG   -c -o src/mul/mul.o src/mul/mul.c
gcc -Wall -Werror -Wextra -pedantic -std=c99 -Isrc/add/ -Isrc/mul/ -Isrc/sub/ -O2 -DNDBUG   -c -o src/sub/sub.o src/sub/sub.c
gcc   src/prog.o src/add/add.o src/mul/mul.o src/sub/sub.o   -o prog
```
```sh
$ make debug
gcc -Wall -Werror -Wextra -pedantic -std=c99 -Isrc/add/ -Isrc/mul/ -Isrc/sub/ -g -fsanitize=address   -c -o src/prog.o src/prog.c
gcc -Wall -Werror -Wextra -pedantic -std=c99 -Isrc/add/ -Isrc/mul/ -Isrc/sub/ -g -fsanitize=address   -c -o src/add/add.o src/add/add.c
gcc -Wall -Werror -Wextra -pedantic -std=c99 -Isrc/add/ -Isrc/mul/ -Isrc/sub/ -g -fsanitize=address   -c -o src/mul/mul.o src/mul/mul.c
gcc -Wall -Werror -Wextra -pedantic -std=c99 -Isrc/add/ -Isrc/mul/ -Isrc/sub/ -g -fsanitize=address   -c -o src/sub/sub.o src/sub/sub.c
gcc -fsanitize=address  src/prog.o src/add/add.o src/mul/mul.o src/sub/sub.o   -o prog
```
```sh
$ make test
gcc -Wall -Werror -Wextra -pedantic -std=c99 -Isrc/add/ -Isrc/mul/ -Isrc/sub/ -g -fsanitize=address   -c -o src/add/add.o src/add/add.c
gcc -Wall -Werror -Wextra -pedantic -std=c99 -Isrc/add/ -Isrc/mul/ -Isrc/sub/ -g -fsanitize=address   -c -o src/mul/mul.o src/mul/mul.c
gcc -Wall -Werror -Wextra -pedantic -std=c99 -Isrc/add/ -Isrc/mul/ -Isrc/sub/ -g -fsanitize=address   -c -o src/sub/sub.o src/sub/sub.c
gcc -Wall -Werror -Wextra -pedantic -std=c99 -Isrc/add/ -Isrc/mul/ -Isrc/sub/ -g -fsanitize=address   -c -o tests/testfile.o tests/testfile.c
gcc -fsanitize=address -lcriterion  src/add/add.o src/mul/mul.o src/sub/sub.o tests/testfile.o   -o test-suite
./test-suite
[----] tests/testfile.c:19: Assertion failed: The expression (add(1, 1)) == (3) is false.
[FAIL] add::fail: (0.00s)
[====] Synthesis: Tested: 5 | Passing: 4 | Failing: 1 | Crashing: 0 
make: *** [Makefile:28: test] Error 1
```
```sh
$ make clean
rm -f prog
rm -f test-suite
rm -f src/prog.o
rm -f  src/add/add.o  src/mul/mul.o  src/sub/sub.o
rm -f  tests/testfile.o tests/testfile.o
```

Remember, the true goal is to make it as generic and elegent as possible not
to brut-force your way by hard coding everything `:)`

**Impress us !**

# Correction

**A** correction will be given during the lecon or afterwards on Discord and
this repo. This is **not** the best solution but take the time to read it as
it uses advanced concepts !
