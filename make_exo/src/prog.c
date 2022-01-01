#include <stdio.h>

#include "add.h"
#include "mul.h"
#include "sub.h"

int main(void)
{
    printf("Cool program !\n");
    int res = add(21, sub(30, mul(3, 3)));
    printf("answer = %d\n", res);
    return 0;
}
