//fpc 3.0.4

program dt;
Uses sysutils;
type  
   day_range = 1 .. 31;
   month_range = 1 .. 12;
   date_t = record
       day : day_range;
       month : month_range;
       year : integer;
end;

   
procedure date_t.init_date1 (date : date_t);
var 
    day : word;
    month : word;
    year : word;
begin 
    DecodeDate (Date, year, month, day);
    date.day := day;
    date.month := month;
    date.year := year;
end;
     
procedure date_t.init_date (date : date_t; day : day_range; month : month_range; year : integer);
begin
    date.year:= year;
    date.month := month;
    date.day := day;
end;
       
function date_t.date_equal (date1 : date_t; date2 : date_t) : boolean;
begin
    date_equal := false;
    if date1.day = date2.day then 
        if date1.month = date2.month then
            if date1.year = date2.year then
                date_equal := true;
end;      
       
function date_t.date_less_than (date1 : date_t; date2 : date_t) : boolean;
begin 
    date_less_than := false;
    if date1.year < date2.year then 
       date_less_than := true
    else if date1.year = date2.year then 
    begin
        if date1.month < date2.month then
            date_less_than := true
        else if date1.month = date2.month then 
        begin 
            if date1.day < date2.day then
                date_less_than := true
            else 
                date_less_than := false;
        end
            else
                date_less_than := true;
    end
        else 
            date_less_than := false;
end;  
       
function date_t.month_str (date : date_t) : string;
begin
    case (date.month) of
        1 : month_str := 'January';
        2 : month_str := 'February';
        3 : month_str := 'March';
        4 : month_str := 'April';
        5 : month_str := 'May'; 
        6 : month_str := 'June';
        7 : month_str := 'July';
        8 : month_str := 'August';
        9 : month_str := 'September';
        10 : month_str := 'October';
        11 : month_str := 'November';
        12 : month_str := 'December';
    else
        month_str := 'Invalid';
        writeln(StdErr, m, ' is not a valid month');
    end
end;

procedure date_t.format_date (date : date_t, var ret_str : string); 
begin 
    ret_str := month_str(date) + ' ' + IntToStr(date.day) + ',' + IntToStr(date.year);
end;

procedure date_t.next_day (date : date_t);

    function month_length (date : date_t) : day_range; 

            function leap_year (year : integer) : boolean;
            begin
                leap_year := ((year mod 4 = 0) and (not (year mod 100 = 0) or (year mod 400 = 0)));
            end;
    var
        leap : boolean;
    begin 
        leap := leap_year(date.year);
        if ((date.month mod 2 = 1) or (date.month = 8)) then
        begin 
            month_length := 30;
        end
            else
            begin
                if date.month = 2 then 
                begin
                    if leap then
                        month_length := 29
                    else 
                        month_length := 28;
                end
                    else
                        month_length := 31;
            end;    
    end;
    
begin
    if (not (date.day + 1 <= month_length(date))) then
    begin 
        date.day := 1;
        if (date.month = 12) then
        begin
            date.month := 1;
            date.year := date.year + 1;
        end
            else 
            begin
                date.month := date.month + 1;
            end
    end
        else 
        begin
            date.day := date.day + 1;
        end;
end;

function BetterBoolToStr(bool : boolean) : string;
begin
    if bool then
        BetterBoolToStr := 'TRUE'
    else
        BetterBoolToStr := 'FALSE'
end;

var
    d1,d2,d3 : date_t;
    format_str : string;
begin
    d1.init_date1();
    d2.init_date(30, 12 , 1999);
    d3.init_date(1, 1, 2000);
    d1.format_date(format_str);
    writeln('d1: ' + format_str);
    d2.format_date(format_str);
    writeln('d2: ' + format_str);
    d3.format_date(format_str);
    writeln('d3: ' + format_str);
    writeln;
    writeln('d1 < d2? ' + BetterBoolToStr(d1.date_less_than(d2)));
    writeln('d2 < d3? ' + BetterBoolToStr(d2.date_less_than(d3)));
    d2.next_day;
    writeln;
    d2.format_date(format_str);
    writeln('next day d2: ' + format_str);
    writeln('d2 < d3? ' + BetterBoolToStr(d2.date_less_than(d3)));
    writeln('d2 = d3? ' + BetterBoolToStr(d2.date_equal(d3)));
    writeln('d2 > d3? ' + BetterBoolToStr(d3.date_less_than(d2)));
    writeln;
    d2.next_day;
    d2.format_date(format_str);
    writeln('next day d2: ' + format_str);
    writeln('d2 = d3? ' + BetterBoolToStr(d2.date_equal(d3)));
    writeln;
    d1.init_date(28, 2, 1529);
    d1.format_date(format_str);
    writeln('initialized d1 to ' + format_str);
    d1.next_day;
    d1.format_date(format_str);
    writeln('next day d1: ' + format_str);
    writeln;
    d1.init_date(28, 2, 1460);
    d1.format_date(format_str);
    writeln('initialized d1 to ' + format_str);
    d1.next_day;
    d1.format_date(format_str);
    writeln('next day d1: ' + format_str);
    writeln;
    d1.init_date(28, 2, 1700);
    d1.format_date(format_str);
    writeln('initialized d1 to ' + format_str);
    d1.next_day;
    d1.format_date(format_str);
    writeln('next day d1: ' + format_str);
    writeln;
    d1.init_date(28, 2, 1600);
    d1.format_date(format_str);
    writeln('initialized d1 to ' + format_str);
    d1.next_day;
    d1.format_date(format_str);
    writeln('next day d1: ' + format_str);
end.
