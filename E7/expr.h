#pragma once
#include <stdio.h>
#include <stdlib.h>

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

struct expr *expr_create(expr_t kind, struct expr *left, struct expr *right);
struct expr *expr_create_value(int value);
int expr_evaluate(struct expr *e);
void expr_print(struct expr *e);