module imports.test3a;

import imports.test3b;

extern(C) int printf(const char*, ...);

class Afoo
{
    static this()
    {
        debug printf("Afoo()\n");
    }
}
