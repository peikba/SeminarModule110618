page 123456736 "Posted Seminar Reg. List"
{
    // CSD1.00 - 2018-01-01 - D. E. Veloper
    //   Chapter 7 - Lab 3
    //     - Created new page

    Caption = 'Posted Seminar Registration List';
    CardPageID = "Posted Seminar Registration";
    Editable = false;
    PageType = List;
    SourceTable = "Posted Seminar Reg. Header";
    UsageCategory=Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("Starting Date";"Starting Date")
                {
                }
                field("Seminar No.";"Seminar No.")
                {
                }
                field("Seminar Name";"Seminar Name")
                {
                }
                field(Status;Status)
                {
                }
                field(Duration;Duration)
                {
                }
                field("Maximum Participants";"Maximum Participants")
                {
                }
                field("Room Resource No.";"Room Resource No.")
                {
                }
            }
        }
        area(factboxes)
        {
            part("Seminar Details FactBox";"Seminar Details FactBox")
            {
                SubPageLink = "No."=Field("Seminar No.");
            }
            systempart("Links";Links)
            {
            }
            systempart("Notes";Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Seminar Registration")
            {
                Caption = '&Seminar Registration';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = Page "Seminar Comment List";
                    RunPageLink = "No."=Field("No.");
                    RunPageView = where("Table Name"=const("Posted Seminar Reg. Header"));
                }
                action("&Charges")
                {
                    Caption = '&Charges';
                    Image = Costs;
                    RunObject = Page 123456739;
                    RunPageLink = "Document No."=Field("No.");
                }
            }
        }
        area(Processing)
        {
            action("&Navigate")
            {
                Caption='&Navigate';
                Image=Navigate;
                Promoted=true;
                PromotedCategory=Process;

                trigger OnAction();
                var
                    Navigate : page Navigate;
                begin
                    Navigate.SetDoc("Posting Date","No.");
                    Navigate.RUN;
                end;
            }        
        }
    }
}

