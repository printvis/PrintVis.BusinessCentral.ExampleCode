query 50100 CapacityCalendarEntriesWS
{
    APIGroup = 'query';
    APIPublisher = 'printvis';
    APIVersion = 'v1.0';
    EntityName = 'CapacityCalendarEntry';
    EntitySetName = 'CapacityCalendarEntries';
    QueryType = API;

    elements
    {
        dataitem(pvsCapacityCalendarEntry; "PVS Capacity Calendar Entry")
        {
            column(calendarCode; "Calendar Code")
            {
            }
            column(calendarGroup; "Calendar Group")
            {
            }
            column(capacityGroup; "Capacity Group")
            {
            }
            column(capacityName; "Capacity Name")
            {
            }
            column(capacityUnit; "Capacity Unit")
            {
            }
            column(creationDate; "Creation Date")
            {
            }
            column(department; Department)
            {
            }
            column(departmentName; "Department Name")
            {
            }
            column(departmentSortingOrder; "Department Sorting Order")
            {
            }
            column(entryNo; "Entry No.")
            {
            }
            column(fromDate; "From Date")
            {
            }
            column(hours; Hours)
            {
            }
            column(normalTimeFrom; "Normal Time From")
            {
            }
            column(normalTimeTo; "Normal Time To")
            {
            }
            column(overtimeFrom; "Overtime From")
            {
            }
            column(overtimeTo; "Overtime To")
            {
            }
            column(teamCode; "Team Code")
            {
            }
            column(toDate; "To date")
            {
            }
        }
    }

    trigger OnBeforeOpen()
    begin

    end;
}
