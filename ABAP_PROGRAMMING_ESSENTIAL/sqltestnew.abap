report z_open_sql_example_01.
tables: usr02.
field-symbols: <usr02> type usr02. 
data: Is_condition type string,
It_usr02 type table of usr02.
parameters: p_user type bname obligatory default sy-uname.
if not p_user is initial.
concatenate 'BNAME = "p_user """ into Is_condition. endif.
select *
from usr02
into corresponding fields of table It_usr02
where (Is_condition).
loop at It_usr02 assigning <usr02>.
write:/<usr02>-BNAME, 'Valid From', <USR02>-GLTGV,
Valid To', <USR02>-GLTGB.
endloop.
