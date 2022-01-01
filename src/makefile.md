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

Here are some of the default rules (use `make -p` to have them all):
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

# Exercice

Your goal is to prepare a makefile to help building piscine-type exercises.

```sh
$ ls
Makefile
file1.c
file2.c
file3.c
file4.c
```

You will create 3 targets:

- library: produce a libfile.a library
- test:
- clean

Here is the gnu manual : [link](https://www.gnu.org/software/make/manual/make.html)
