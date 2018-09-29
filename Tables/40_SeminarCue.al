table 123456740 "CSD Seminar Cue"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(10;"Primary key";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Planned";Integer)
        {
            Caption='Planned';
            FieldClass=FlowField;
            CalcFormula=count("CSD Seminar Reg. Header" where(Status=const(Planning)));
            editable=false;
        }
        field(30;"Registration";Integer)
        {
            Caption='Registration';
            FieldClass=FlowField;
            CalcFormula=count("CSD Seminar Reg. Header" where(Status=const(Registration)));
            editable=false;
        }
        field(40;"Closed";Integer)
        {
            Caption='Closed';
            FieldClass=FlowField;
            CalcFormula=count("CSD Seminar Reg. Header" where(Status=const(Closed)));
            editable=false;
        }
    }

    keys
    {
        key(PK;"Primary key")
        {
            Clustered = true;
        }
    }
}