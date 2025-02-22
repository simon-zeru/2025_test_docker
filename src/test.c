#include <stdio.h>
#include "calc.h"
#include <assert.h>

void test_add() {
    assert(add(2, 3) == 5);
    assert(add(-1, 1) == 0);
    assert(add(-2, -3) == -5);
    printf("add() tests passed\n");
}

void test_subtract() {
    assert(subtract(10, 5) == 5);
    assert(subtract(0, 5) == -5);
    assert(subtract(5, -5) == 10);
    printf("subtract() tests passed\n");
}

void test_multiply() {
    assert(multiply(3, 4) == 12);
    assert(multiply(-2, 3) == -6);
    assert(multiply(0, 5) == 0);
    printf("multiply() tests passed\n");
}

void test_divide() {
    assert(divide(10, 2) == 5);
    assert(divide(9, 3) == 3);
    assert(divide(7, 0) == 0);  
    printf("divide() tests passed\n");
}

void run_tests() {
    test_add();
    test_subtract();
    test_multiply();
    test_divide();
}

int main()
{
    run_tests();
    return 0;
}
