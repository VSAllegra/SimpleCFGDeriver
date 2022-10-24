//fpc 3.0.4

program dt;
Uses sysutils;
type  
   day_range = 1 .. 31;
   month_range = 1 .. 12;
   date_t = object
   private 
       d : day_range;
       m : month_range;
       y : integer;
   public
       function get_day () : day_range;
       
       function get_month () : month_range;
       
       function get_year () : integer;
       
       procedure init_date1 ();
       
       procedure init_date (day : day_range; month : month_range; year : integer);
       
       function date_equal (date2 : date_t) : boolean;
       
       function date_less_than (date2 : date_t) : boolean;
       
       function month_str () : string;
       
       procedure format_date (var ret_str : string); 
       
       procedure next_day ();
end;

function date_t.get_day () : day_range;
begin 
   get_day := d;
end;
       
function date_t.get_month () : month_range;
begin
    get_month := m;
end;
       
function date_t.get_year () : integer;
begin
    get_year := y;
end;
       
procedure date_t.init_date1 ();
var 
    day : word;
    month : word;
    year : word;
begin 
    DecodeDate (Date, year, month, day);
    d := day;
    m := month;
    y := year;
end;
     
procedure date_t.init_date (day : day_range; month : month_range; year : integer);
begin
    y := year;
    m := month;
    d := day;
end;
       
function date_t.date_equal (date2 : date_t) : boolean;
begin
    date_equal := false;
    if d = date2.get_day then 
        if m = date2.get_month then
            if y = date2.get_year then
                date_equal := true;
end;      
       
function date_t.date_less_than (date2 : date_t) : boolean;
begin 
    date_less_than := false;
    if y < date2.get_year then 
       date_less_than := true
    else if y = date2.get_year then 
    begin
        if m < date2.get_month then
            date_less_than := true
        else if m = date2.get_month then 
        begin 
            if d < date2.get_day then
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
       
function date_t.month_str () : string;
begin
    case (m) of
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

procedure date_t.format_date (var ret_str : string); 
begin 
    ret_str := month_str() + ' ' + IntToStr(d) + ',' + IntToStr(y);
end;

procedure date_t.next_day ();

    function month_length () : day_range; 

            function leap_year () : boolean;
            begin
                leap_year := ((y mod 4 = 0) and (not (y mod 100 = 0) or (y mod 400 = 0)));
            end;
    var
        leap : boolean;
    begin 
        leap := leap_year();
        if ((m mod 2 = 1) or (m = 8)) then
        begin 
            month_length := 30;
        end
            else
            begin
                if m = 2 then 
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
    if (not (d + 1 <= month_length())) then
    begin 
        d := 1;
        if (m = 12) then
        begin
            m := 1;
            y := y + 1;
        end
            else 
            begin
                m := m + 1;
            end
    end
        else 
        begin
            d := d + 1;
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
