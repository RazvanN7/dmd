// https://issues.dlang.org/show_bug.cgi?id=18016
// REQUIRED_ARGS: -de

/*
TEST_OUTPUT:
---
test.d(13): Deprecation: `void` initialization is deprecated in `@safe` code
---
*/

int f() @safe
{
    int x = void;
    return x;
}

