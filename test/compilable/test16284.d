// https://issues.dlang.org/show_bug.cgi?id=16284

struct S {}

struct T
{
    union {int i; S s;}
    this(uint dummy) { s = S.init; }
}

bool test()
{
    auto t1 = T(0);
    auto t2 = T(0);
    return t1 == t2;
}

static assert(test());
