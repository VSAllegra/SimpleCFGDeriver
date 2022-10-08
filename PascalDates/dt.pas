
program dt;
var
   max_date : integer;
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

       
date_t.function get_day (day : day_range);
       
date_t.function get_month (month : month_range);
       
date_t.function get_year (year : integer);
       
date_t.procedure init_date1 (var dt : date_t);
       
date_t.procedure init_date (var dt : date_t; day : day_range; month : month_range; year : integer);
       
date_t.function date_equal (date1: date_t; date2 : date_t) : boolean;
       
date_t.function date_less_than (date1 : date_t; date2 : date_t) : boolean;
       
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