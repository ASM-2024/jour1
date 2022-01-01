---
title: "GDB"
author: noe.audemard
logo: https://www.epita.fr/wp-content/themes/epita-theme/assets/img/svg/EPITA\_LOGO\_INGENIEUR\_CMJN.svg
---

# What is GDB ?

The GNU DeBugger (GDB for short), is a debugger that runs on many Unix-like systems, including Linux.
In short, a debugger is used to run a target program step by step, in a controlled environment. This allows the user to monitor the behavior of the target at all stages of execution, which makes debugging much easier.
GDB can be used to debug many languages, such as Assembly, C, C++ and Rust. This means it will be your main debugging tool for the S4 and Ing1.

# How to use GDB for C code
Use the provided debugme.c file for the following tutorial\
\
The first step to using GDB with the c language is to add "-g" to the compilation flags you use\
 ```gcc debugme.c -g```\
This adds debugging information to the executable. This debugging information contains variable types, function prototypes...

Next, you have to run your program with GDB.\
```gdb ./a.out```\
This will open GDB. You can now start the execution of the program by typing ```start```.\
GDB will print the line you are currently on. In order to execute the next line, you can type ```next```\
If you want to see the lines around the one you are currently on, you can use ```list```. You can put a number after list to specify how many lines you want to show.\
Another way of doing this is by typing ```tabset```. This will change the layout of the debugger and persistently show the lines around the one you are running. This is what we recommend using.\
\
You can start the program again by typing ```start``` again, for example if you reached the end of the program.\
\
If you used ```tabset``` or ```list``` properly, you should be seeing the subfunction *multiply*. In order to debug a subfunction, you need to use ```step``` instead of ```next``` in the line the function is called. Try it\
\
If you want to stop GDB, you can use either ```quit``` or Ctrl-D\
\
This concludes the basic of using GDB

# Printing information

# Breakpoints

# Abbreviations

# Tips and tricks

No need to repeat the same command multiple times in a row\
\
Ctrl-X O\

