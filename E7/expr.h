#pragma once
#include <stdio.h>

typedef enum {
    EXPR_ADD,
    EXPR_SUBTRACT,
    EXPR_DIVIDE,
    EXPR_MULT,
    EXPR_VALUE
} expr_t;

struct expr {
    expr_t kind;
    struct expr *left;
    struct expr *right;
    int value;
};
