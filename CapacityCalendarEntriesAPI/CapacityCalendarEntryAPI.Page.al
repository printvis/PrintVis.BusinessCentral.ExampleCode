page 50100 "Capacity Calendar Entry API"
{
    APIGroup = 'DevHours';
    APIPublisher = 'PrintVis';
    APIVersion = 'v1.0';
    Caption = 'capacityCalendarEntryAPI';
    DelayedInsert = true;
    EntityName = 'CapacityCalendarEntry';
    EntitySetName = 'CapacityCalendarEntries';
    PageType = API;
    SourceTable = "PVS Capacity Calendar Entry";
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(calendarCode; Rec."Calendar Code")
                {
                    Caption = 'Calendar Code';
                }
                field(calendarGroup; Rec."Calendar Group")
                {
                    Caption = 'Calendar Group';
                }
                field(capacityGroup; Rec."Capacity Group")
                {
                    Caption = 'Capacity Group';
                }
                field(capacityName; Rec."Capacity Name")
                {
                    Caption = 'Capacity Name';
                }
                field(capacityUnit; Rec."Capacity Unit")
                {
                    Caption = 'Capacity Unit';
                }
                field(hours; Rec.Hours)
                {
                    Caption = 'Hours';
                }
                field(department; Rec.Department)
                {
                    Caption = 'Department';
                }
                field(departmentName; Rec."Department Name")
                {
                    Caption = 'Department Name';
                }
                field(creationDate; Rec."Creation Date")
                {
                    Caption = 'Date of Creation';
                }
                field(fromDate; Rec."From Date")
                {
                    Caption = 'From Date';
                }
                field(toDate; Rec."To date")
                {
                    Caption = 'To date';
                }
                field(teamCode; Rec."Team Code")
                {
                    Caption = 'Team Code';
                }
                field(normalTimeFrom; Rec."Normal Time From")
                {
                    Caption = 'From';
                }
                field(normalTimeTo; Rec."Normal Time To")
                {
                    Caption = 'To';
                }
                field(overtimeFrom; Rec."Overtime From")
                {
                    Caption = 'Overtime from';
                }
                field(overtimeTo; Rec."Overtime To")
                {
                    Caption = 'Overtime to';
                }
            }
        }
    }

}
