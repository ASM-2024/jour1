#include <criterion/criterion.h>

#include "add.h"
#include "mul.h"
#include "sub.h"

Test(add, simple)
{
    cr_assert_eq(add(3, 4), 7);
}

Test(add, simple2)
{
    cr_assert_eq(add(7, 4), 11);
}

Test(add, fail)
{
    cr_assert_eq(add(1, 1), 3);
}

Test(mul, simple)
{
    cr_assert_eq(mul(21, 2), 42);
}

Test(sub, simple)
{
    cr_assert_eq(sub(44, 2), 42);
}
