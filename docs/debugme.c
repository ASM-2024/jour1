#include <stddef.h>

size_t multiply(size_t num1, size_t *num2)
{
    int result = 0;

    while (*num2 > 0)
    {
        result += num1;
        *num2 -= 1;
    }
    return result;
}

int main(void)
{
    size_t num1 = 5;
    size_t num2 = 3;
    size_t result = multiply(num1, &num2);
    return result;
}
