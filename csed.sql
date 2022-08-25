SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET FEEDBACK OFF;
declare
 lab_namee varchar(20);
 b_id varchar(10);
 f_id int;
 r_id int;
 bn varchar(10);
 nb varchar(20);
 fn int;
 rn int;
 cursor find_lab is select block_id, floor_id, room_id  from lab where lab_name=lab_namee;
begin
 lab_namee:='&lab_namee';
 open find_lab;
 fetch find_lab into b_id,f_id,r_id;
 close find_lab;
 select block_name,nearby into bn,nb from bblock where block_id=b_id;
 select floor_number into fn from floor where floor_id=f_id;
 select room_number into rn from room where room_id=r_id;
 dbms_output.put_line ('The location of your lab is ');
 dbms_output.put_line ('Lab Name : ' || lab_namee);
 dbms_output.put_line ('Block : '||bn);
 dbms_output.put_line ('Nearby : ' || nb);
 dbms_output.put_line ('Floor number : '||fn);
 dbms_output.put_line ('Room number : '||rn);
 exception when no_data_found then
  dbms_output.put_line('No such lab available in database');
 when others then
  dbms_output.put_line ('Error');
end;
