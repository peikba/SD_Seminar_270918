page 123456770 ALIssueList
{
    PageType = List;
    SourceTable = ALIssue;
    CaptionML = ENU = 'AL Issues';
    Editable = false;
    SourceTableView = order(descending);
    UsageCategory=Tasks;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Number; number) { }
                field(Title; title) { }
                field(CreatedAt; created_at) { }
                field(User; user) { }
                field(State; state) { }
                field(URL; html_url)
                {
                    ExtendedDatatype = URL;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Download Issues")
            {
                Caption='Download Issues';
                 RunObject=codeunit "Download AL Issues";
                 Image=GetLines;
                 Promoted=true;
                 PromotedCategory=process;
            }
        }
    }
    trigger OnOpenPage();
    begin
        if not get then begin
            init;
            insert;
        end;
        
    end;
}