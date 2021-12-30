---
title: "GNU Make"
author: mathieu.fourre
logo: https://www.epita.fr/wp-content/themes/epita-theme/assets/img/svg/EPITA\_LOGO\_INGENIEUR\_CMJN.svg
---

# Let's use Make

You have already use `Make` this year but many of you haven't really understood
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

# Default variables

As you can see, these rules use standardised variables.
You change these variables.

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
