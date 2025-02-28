#include "expr.h"
struct expr *expr_create(expr_t kind, struct expr *left, struct expr *right)
{
    struct expr *e = malloc(sizeof(*e));
    e->kind = kind;
    e->value = 0;
    e->left = left;
    e->right = right;
    return e;
}

struct expr *expr_create_value(int value)
{
    struct expr *e = expr_create(EXPR_VALUE, 0, 0);
    e->value = value;
    return e;
}

int expr_evaluate(struct expr *e)
{
    if (!e)
        return 0;
    int l = expr_evaluate(e->left);
    int r = expr_evaluate(e->right);
    switch (e->kind)
    {
    case EXPR_VALUE:
        return e->value;
    case EXPR_ADD:
        return l + r;
    case EXPR_SUBTRACT:
        return l - r;
    case EXPR_MULT:
        return l * r;
    case EXPR_DIVIDE:
        if (r == 0)
        {
            printf("error: divide by zero\n");
            exit(1);
        }
        return l / r;
    }
    return 0;
}

void expr_print(struct expr *e)
{
    if (!e)
    {
        return 0;
    }

    switch (e->kind)
    {
    case EXPR_MULT:
    {
        int v1,v2;
        printf(" * ");
    }
    }
}