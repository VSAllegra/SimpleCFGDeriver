//fpc 3.0.4

program dt;
type  
   day_range = 1 .. 31;
   month_range = 1 .. 12;
   date_t = object
   private 
       d : day_range;
       m : month_range;
       y : integer;
   public
       function get_day (day : day_range);
       
       function get_month (month : month_range);
       
       function get_year (year : integer);
       
       procedure init_date1 (var dt : date_t);
       
       procedure init_date (var dt : date_t; day : day_range; month : month_range; year : integer);
       
       function date_equal (date1: date_t; date2 : date_t) : boolean;
       
       function date_less_than (date1 : date_t; date2 : date_t) : boolean;
       
       function month_str (month : month_range) : string;
       
       procedure format_date (var dt : date_t; var ret_str : string); 
       
       procedure next_day (var dt : date_t);
       
       function leap_year (year : integer) : boolean;
       
       function month_length (month : month_range; leap : boolean) : day_range; 
end;

function date_t.get_day ();
begin 
   get_day := d;
end;
       
function date_t.get_month ();
begin
    get_month := m;
end;
       
function date_t.get_year ();
begin
    get_year := y;
end;
       
procedure date_t.init_date1 ();
     
procedure date_t.init_date (day : day_range; month : month_range; year : integer);
begin
    y := year;
    m := month;
    d := day;
    if (d > month_length(m, leap_year(y))) then
        writeln(StdErr, 'Date is Invalid'); 
end;
       
function date_t.date_equal (date2 : date_t) : boolean;
begin
    date_equal := false;
    if d = date2.get_date then 
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
        end;
            else
                date_less_than = true;
    end;
        else 
            date_less_than := false;
end;  
       
function date_t.month_str (month : month_range) : string;
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
    end;
    else
        writeln(StdErr, month, ' is not a valid month');
end;

procedure date_t.formatdate (var ret_str : string); 
begin 
    ret_str := month_str(m) + ' ' + IntToStr(d) + ',' + IntToStr(y);
end;

procedure date_t.next_day ();
begin
    if d + 1 <= month_length(m, leap_year(y)) then
        Inc(d);
    else
        d := 1;
        if m = 12 then
            m := 1
            Inc(y)
        else
            Inc(m);
end;



       
function date_t.leap_year (year : integer) : boolean;
begin
    leap_year := year mod 4 = 0;
end;
       
function date_t.month_length (month : month_range; leap : boolean) : day_range; 
begin 
    if (month mod 2 = 1 or month = 8) then
    begin 
        if month = 2 then 
        begin
            if leap then
                month_length = 29
            else 
                month_length = 28;
        end;
            else 
                month_length = 30;
    end; 
        else 
            month_length = 31;
end;

var
    d1,d2,d3 : date_t;
    format_str : string;
begin
    writeln('Hello, world!');
end.
