pageextension 123456715 "CSD Order Processor RC Ext" extends "Order Processor Role Center"
{
    actions
    {
        addlast(Embedding)
        {
            action(Resources)
            {
                RunObject=page "Resource List";
            }
        }
    }
    
    var
        myInt : Integer;
}