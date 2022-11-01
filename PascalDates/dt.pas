(* Vinny Allegra, Pascal Dates*)  
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

   
procedure init_date1 (var dt : date_t);
var 
    day : word;
    month : word;
    year : word;
begin 
    DecodeDate (Date, year, month, day);
    dt.day := day;
    dt.month := month;
    dt.year := year;
end;
     
procedure init_date (var dt : date_t; day : day_range; month : month_range; year : integer);
begin
    dt.year:= year;
    dt.month := month;
    dt.day := day;
end;
       
function date_equal (date1 : date_t; date2 : date_t) : boolean;
begin
    date_equal := false;
    if date1.day = date2.day then 
        if date1.month = date2.month then
            if date1.year = date2.year then
                date_equal := true;
end;      
       
function date_less_than (date1 : date_t; date2 : date_t) : boolean;
begin 
    date_less_than := false;
    (* Check if one year is less than the other*)
    if date1.year < date2.year then 
       date_less_than := true
    else if date1.year = date2.year then 
    begin
        (* Check if one month is less than the other*)
        if date1.month < date2.month then
            date_less_than := true
        else if date1.month = date2.month then 
        begin 
            (* Check if one day is less than the other*)
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
       
function month_str (month : month_range) : string;
begin
    case (month) of
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
        writeln(StdErr, month, ' is not a valid month');
    end
end;

procedure format_date (dt : date_t; var ret_str : string); 
begin 
    ret_str := month_str(dt.month) + ' ' + IntToStr(dt.day) + ', ' + IntToStr(dt.year);
end;

procedure next_day (var dt : date_t);

    function leap_year (year : integer) : boolean;
        begin
            leap_year := ((year mod 4 = 0) and (not (year mod 100 = 0) or (year mod 400 = 0)));
        end;

    function month_length (month : month_range; leap : boolean) : day_range; 
    begin 
        (* Month is odd or is August*)
        if ((month mod 2 = 1) or (month = 8)) then
        begin 
            month_length := 30;
        end
            else
            begin
                (*If Month is February check for leap year*)
                if month = 2 then 
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
    (* Make sure goign to next day does not lead into new month *)
    if (not (dt.day + 1 <= month_length(dt.month, leap_year(dt.year)))) then
    begin 
        dt.day := 1;
        (* If its December go to a new year, set to January *)
        if (dt.month = 12) then
        begin
            dt.month := 1;
            dt.year := dt.year + 1;
        end
            else 
            begin
                dt.month := dt.month + 1;
            end
    end
        else 
        begin
            dt.day := dt.day + 1;
        end;
end;

(* Function for converting boolean type to String *)
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
    init_date1(d1);
    init_date(d2, 30, 12 , 1999);
    init_date(d3, 1, 1, 2000);
    format_date(d1, format_str);
    writeln('d1: ' + format_str);
    format_date(d2, format_str);
    writeln('d2: ' + format_str);
    format_date(d3, format_str);
    writeln('d3: ' + format_str);
    writeln;
    writeln('d1 < d2? ' + BetterBoolToStr(date_less_than(d1,d2)));
    writeln('d2 < d3? ' + BetterBoolToStr(date_less_than(d2,d3)));
    next_day(d2);
    writeln;
    format_date(d2, format_str);
    writeln('next day d2: ' + format_str);
    writeln('d2 < d3? ' + BetterBoolToStr(date_less_than(d2,d3)));
    writeln('d2 = d3? ' + BetterBoolToStr(date_equal(d2,d3)));
    writeln('d2 > d3? ' + BetterBoolToStr(date_less_than(d3,d2)));
    writeln;
    next_day(d2);
    format_date(d2, format_str);
    writeln('next day d2: ' + format_str);
    writeln('d2 = d3? ' + BetterBoolToStr(date_equal(d2,d3)));
    writeln;
    init_date(d1, 28, 2, 1529);
    format_date(d1, format_str);
    writeln('initialized d1 to ' + format_str);
    next_day(d1);
    format_date(d1, format_str);
    writeln('next day d1: ' + format_str);
    writeln;
    init_date(d1, 28, 2, 1460);
    format_date(d1, format_str);
    writeln('initialized d1 to ' + format_str);
    next_day(d1);
    format_date(d1, format_str);
    writeln('next day d1: ' + format_str);
    writeln;
    init_date(d1, 28, 2, 1700);
    format_date(d1, format_str);
    writeln('initialized d1 to ' + format_str);
    next_day(d1);
    format_date(d1, format_str);
    writeln('next day d1: ' + format_str);
    writeln;
    init_date(d1, 28, 2, 1600);
    format_date(d1, format_str);
    writeln('initialized d1 to ' + format_str);
    next_day(d1);
    format_date(d1, format_str);
    writeln('next day d1: ' + format_str);
end.
