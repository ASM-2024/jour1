---
title: "GNU Make"
author: mathieu.fourre
logo: https://www.epita.fr/wp-content/themes/epita-theme/assets/img/svg/EPITA\_LOGO\_INGENIEUR\_CMJN.svg
---

# Let's use Make

# Why ?

let's do an example with `make`

```make
CFLAGS= -Wall -Werror

all: dep.c
```

here is the gnu manual : [link](https://www.gnu.org/software/make/manual/make.html)

# blob

```c
#include <stdio.h>

#define TRUE 1

int main(int argc, char **argv)
{
    if (TRUE)
        printf("Hello world!\n");
    return 0;
}

```
---

after a break
