---
title: "GDB"
author: noe.audemard
logo: https://avatars.githubusercontent.com/u/96961500?s=200&v=4
---

# What is GDB ?

The GNU DeBugger (GDB for short), is a debugger that runs on many Unix-like systems, including Linux.
In short, a debugger is used to run a target program step by step, in a controlled environment.
This allows the user to monitor the behavior of the target at all stages of execution, which makes debugging much easier.
GDB can be used to debug many languages, such as Assembly, C, C++ and Rust. This means it will be your main debugging tool for the S4 and Ing1.\

Refer to https://ftp.gnu.org/old-gnu/Manuals/gdb/html_chapter/gdb_toc.html for a complete guide.

# How to use GDB for C code
Use the provided [debugme.c](debugme.c) file for the following tutorial\
\
The first step to using GDB with the c language is to add "-g" to the compilation flags you use\
 ```gcc debugme.c -g```\
This adds debugging information to the executable. This debugging information contains variable types, function prototypes...

Next, you have to run your program with GDB.\
```gdb ./a.out```\
This will open GDB. You can now start the execution of the program by typing ```start```.\
GDB will print the line you are currently on. In order to execute the next line, you can type ```next```\
If you want to see the lines around the one you are currently on, you can use ```list```. You can put a number after list to specify how many lines you want to show.\
Another way of doing this is by typing ```tabset```.
This will change the layout of the debugger and persistently show the lines around the one you are running. This is what we recommend using.\
\
You can start the program again by typing ```start``` again, for example if you reached the end of the program.\
\
If you used ```tabset``` or ```list``` properly, you should be seeing the subfunction *multiply*.
In order to debug a subfunction, you need to use ```step``` instead of ```next``` in the line the function is called. Try it\
\
If you want to stop GDB, you can use either ```quit``` or Ctrl-D\
\
This concludes the basic of using GDB

# Printing information

In order to debug efficiently, you will need to know the value of the variables of your program. To do that in GDB, you can use ```print myvar```\
You can also print an expression: \
```print mylist[2]```\
```print *mypointer```\
You can also cast the variables you print"\
\
A very useful feature of the GDB print function is the *format*. You can use it the following way:\
```print /MyFormat MyVar```\
The valid formats are:\
o - octal\
x - hexadecimal\
u - unsigned decimal\
t - binary\
f - floating point\
a - address\
c - char\
\
If you need to print something very often, you can use the ```display``` command.
It is used the same way as the ```print``` command, except it will print what you asked it to every time you write another command.\
To stop a display, you can use ```undisplay```.

# Breakpoints

`When debugging a specific portion of a program, using ```next``` over and over can be very tedious. Instead of doing this, you can use breakpoints:\
 - Set one or more breakpoints in the portions of the program you want to debug\
 - Use ```continue```\
In order to set a breakpoint, you do:\
```break FunctionName``` or ```break LineNumber```. There are other ways of settings breakpoints.\
The ```continue``` function will execute the program until it reaches a breakpoint or the end of the program.\
We highly recommend you also learn to use the basics of watchpoints and catchpoints even if we wont cover them here:\
[Watchpoints](https://ftp.gnu.org/old-gnu/Manuals/gdb/html_node/gdb_29.html#SEC30)\
[Catchpoints](https://ftp.gnu.org/old-gnu/Manuals/gdb/html_node/gdb_30.html#SEC31)

# Abbreviations

Since typing the name of the commands in full is long and rather useless, GDB accomodates abbreviations.
You can type the beginning of a command and, as long as no other command has the same name, GDB will recognize what you meant.\
Common abbreviations are:\
 - next --> n\
 - step --> s\
 - break --> b\
 - continue --> c\
 - tabset --> tab\
And many more

# Tips and tricks

If you press enter while no command is written, GDB will repeat the last command used.
This means that there is no need to repeat the same command multiple times in a row\
\
You can change what part of GDB is focused by using *Ctrl-x o*.
This is very useful because specific keyboard inputs (E.g. Directional arrows) affect the part of GDB that is focused.
If the terminal part is focused, you can use the arrows to modify the current command and go back to the previous commands, just like in a normal terminal.\
\
If you want to debug a program with arguments, you can do the following: ```gdb --args ./MyProgram arg1 arg2```

# Going further

GDB has implemented reverse-debugging, which allows you to go back in your program: [Reverse debuggin with GDB](https://sourceware.org/gdb/wiki/ReverseDebug)\
\
As said in the Breakpoint section, read up on [Watchpoints](https://ftp.gnu.org/old-gnu/Manuals/gdb/html_node/gdb_29.html#SEC30)
and [Catchpoints](https://ftp.gnu.org/old-gnu/Manuals/gdb/html_node/gdb_30.html#SEC31)

