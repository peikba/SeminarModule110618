codeunit 123456702 SeminarRegPrinted
//   Chapter 9 - Lab 1-2
//     - Added Codeunit
{
    TableNo="Seminar Registration Header";

    trigger OnRun();
    begin
        Find;
        "No. Printed" += 1; 
        Modify;
        Commit;
    end;
}
