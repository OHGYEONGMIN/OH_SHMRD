select * from ses_electricityuse;

create or replace view ses_electricityuse_view as
select ses_roomnum as room, ses_product as item_name, to_char(ses_date,'yyyymmdd') as day, ses_electricity, ses_usingtime * ses_wh as use_wh from ses_electricityuse;

select * from SES_ELECTRICITYUSE_view;



select room,item_name,day,use_wh from SES_ELECTRICITYUSE_view where room = '101' and day = '20210305' and item_name = 'sr1';

create or replace view memberView
as select ses_no as no, ses_id as id, ses_pw as pw, ses_name as name, ses_sex as sex, ses_tel as tel, ses_addr as addr, ses_mail as mail, ses_roomnum as room, ses_accept as accept
from ses_member;

select * from MEMBERVIEW;