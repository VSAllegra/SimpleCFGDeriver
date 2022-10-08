//fpc 3.0.4

program dt;
var
   md : integer;
type  
   day_range = 1 .. 31;
   month_range = 1 .. 12;
   date_t = object
   private 
       d : day_range;
       m : month_range;
       y : integer;
   public
       procedure set_max_date (max_date : integer); 
       
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

date_t.procedure set_max_date (max_date : integer); 
begin
    md := max_date;
end;

date_t.function get_day ();
begin 
   get_day := d;
end;
       
date_t.function get_month ();
begin
    get_month := m;
end;
       
date_t.function get_year ();
begin
    get_year := y;
end;
       
date_t.procedure init_date1 ();
     
date_t.procedure init_date (day : day_range; month : month_range; year : integer);
begin
    d := day;
    m := month;
    y := year;
end;
       
date_t.function date_equal (date2 : date_t) : boolean;
begin
    date_equal := false;
    if d = date2.get_date() then 
        if m = date2.get_month() then
            if y = date2.get_year() then
                date_equal := true;
end;      
       
date_t.function date_less_than (date2 : date_t) : boolean;
begin 
    date_less_than := false;
    if y < date2.get_year() then 
       date_less_than := true
    else if y = date2.get_year() then 
    begin
        if m < date2.get_month() then
            date_less_than := true
        else if m = date2.get_month() then 
        begin 
            if d < date2.get_day() then
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
       
date_t.function month_str (month : month_range) : string;
       
date_t.procedure format_date (var dt : date_t; var ret_str : string); 
       
date_t.procedure next_day (var dt : date_t);
       
date_t.function leap_year (year : integer) : boolean;
       
date_t.function month_length (month : month_range; leap : boolean) : day_range; 

var
    d1,d2,d3 : date_t;
    format_str : string;
begin
    writeln('Hello, world!');
end.
