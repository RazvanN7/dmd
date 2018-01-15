/* REQUIRED_ARGS:
 * PERMUTE_ARGS:
 */

// https://issues.dlang.org/show_bug.cgi?id=17686

interface INode
{
    @property INode parentNode();
    @property IDocument ownerDocument();
}
interface IDocument: INode {}
interface IEntityReference: INode {}

class DOMImplementation(T)
{
    abstract class Node: INode
    {
        override
        {
            @property Node parentNode() { return null; }
            @property Document ownerDocument() { return null; }
        }

        @property bool readonly() { return true; }
    }
    abstract class NodeWithChildren: Node
    {
        override
        {
            @property Node parentNode() { return null; }
            @property Document ownerDocument() { return null; }
        }
    }

    class Document: NodeWithChildren, IDocument
    {
        override
        {
            @property Node parentNode() { return null; }
            @property Document ownerDocument() { return null; }
        }
    }

    class EntityReference: NodeWithChildren, IEntityReference
    {
        override
        {
            @property Node parentNode() { return null; }
            @property Document ownerDocument() { return null; }
            @property bool readonly() { return true; }
        }
    }

}

void main()
{
	alias aaa = DOMImplementation!string;
}

