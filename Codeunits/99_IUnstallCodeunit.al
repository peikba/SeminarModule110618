codeunit 123456799 "CSD Install Codeunit"
{
    Subtype=Install;

    trigger OnRun();
    begin
    end;
    
    trigger OnInstallAppPerCompany();
    var
        myInt : Integer;
    begin
       if not InitSetup then 
       begin
           CreateSeminars;
           CreateResources;

       end; 
    end;
    
    local procedure InitSetup() : Boolean;
    var
     NoSerie: Record "No. Series";
        NoSerieLine: Record "No. Series Line";
        SeminarSetup: Record "Seminar Setup";
        SourceCodeSetup: Record "Source Code Setup";
        SourceCode: Record "Source Code";
    begin
        if SeminarSetup.get then 
            exit(false);
        
                SeminarSetup.init;
        if SeminarSetup.Insert then;

        NoSerie.Code := 'SEM';
        NoSerie.Description := 'Seminars';
        NoSerie."Default Nos.":=true;
        NoSerie."Manual Nos.":=true;

        if NoSerie.Insert then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SEM0000';
        if NoSerieLine.Insert then;
        SeminarSetup."Seminar Nos." := NoSerie.code;

        NoSerie.Code := 'SEMREG';
        NoSerie.Description := 'Seminar Registrations';
        NoSerie."Default Nos.":=true;
        NoSerie."Manual Nos.":=false;
        if NoSerie.Insert then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SEMREG0000';
        if NoSerieLine.Insert then;
        SeminarSetup."Seminar Registration Nos." := NoSerie.code;

        NoSerie.Code := 'SEMREGPOST';
        NoSerie.Description := 'Posted Seminar Registrations';
        NoSerie."Default Nos.":=true;
        NoSerie."Manual Nos.":=true;
        if NoSerie.Insert then;

        NoSerieLine."Series Code" := NoSerie.Code;
        NoSerieLine."Starting No." := 'SEMPREG0000';
        if NoSerieLine.Insert then;
        SeminarSetup."Posted Seminar Reg. Nos." := NoSerie.code;

        SeminarSetup.Modify;

        SourceCode.Code := 'SEMINAR';
        if SourceCode.Insert then;
        SourceCodeSetup.get;
        //SourceCodeSetup."CSD Seminar" := 'SEMINAR';
        SourceCodeSetup.modify;
         end;

local procedure CreateSeminars();
var
    Course : Record Course;
    Seminar : Record Seminar;
begin
    if Course.findset then repeat
        Seminar.Init;
        Seminar."No.":=Course.code;
        Seminar.Name:=course.Description;
        Seminar."Seminar Duration":=Course.Duration;
        seminar."Seminar Price":=Course.Price;
        Seminar."Gen. Prod. Posting Group":='MISC';
        Seminar."VAT Prod. Posting Group":='VAT25';
        if Seminar.Insert then ;
    until Course.Next=0;
end;
local procedure CreateResources();
    var
        Resource: Record Resource;
    begin
        Resource.init;
        Resource."No.":='INSTR';
        Resource.Name:='Mr. Instructor';
        Resource.validate("Gen. Prod. Posting Group",'MISC');
        Resource."Direct Unit Cost":=100;
        Resource."CSD Quantity Per Day":=8;
        Resource.Type:=Resource.Type::Person;
        if Resource.Insert then;
        Resource."No.":='ROOM 01';
        Resource.Name:='Room 01';
        Resource.Type:=Resource.Type::Machine;
        if Resource.Insert then;
    end;

var
        SeminarSetup : Record "Seminar Setup";
}