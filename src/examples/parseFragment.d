import ddmd.parse;
import ddmd.astbase;
import ddmd.transitivevisitor;

import ddmd.id;
import ddmd.globals;
import ddmd.identifier;

import core.memory;

void main()
{
    GC.disable();

    Id.initialize();
    global._init();
    global.params.isLinux = true;
    global.params.is64bit = (size_t.sizeof == 8);
    global.params.useUnitTests = true;
    ASTBase.Type._init();


    string input = "{
                      for (int i=0; i<n; i++) { sum += i; }
                      int fun(int a) {return a++;}
                      int eight = fun(7);
                    }";

    scope p = new Parser!ASTBase(null, input, false);
    p.nextToken();

    ASTBase.Statement st = p.parseStatement(PScurly);

    scope vis = new TransitiveVisitor();
    st.accept(vis);
}
