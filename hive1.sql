#loading data into mysql

mysql -u root -p password 

#creating database bank
create database bank;
use bank;


#creating table in mysql and inserting the data into mysql tables

create table loan_info(loan_id int,
                       user_id int,
                       last_payement_date Date,
                       payement_installation Double,
                       date_payable    Date);

insert into loan_info values(1234, 5678, '2017-02-20',509,'2017-03-20');
insert into loan_info values(1243, 5687, '2016-02-18',9087,'2016-03-18');
insert into loan_info values(1324, 5786, '2017-09-01',8976,'2017-04-01');
insert into loan_info values(4312, 8976, '2017-01-18',9087,'2017-02-18');


create table credit_card_info(cc_number bigint,
                              user_id   int,
                              maximum_credit double,
                              outstanding_balance double,
                              due_date date);


insert into credit_card_info values(1234678753672899, 1234, 50000,35000,'2017-03-22');
insert into credit_card_info values(1234678753672900, 1243, 500000,500000,'2017-03-22');
insert into credit_card_info values(1234678753672902, 1324, 15000,12000,'2017-03-09');
insert into credit_card_info values(1234678753672908, 4312, 60000,60000,'2017-02-16');


create table shares_info(share_id varchar(10),
                         company_name varchar(20),
                         gmt_timestamp bigint,
                         share_price double);

insert into shares_info values('s102',"MyCorp",1488412702,100);
insert into shares_info values('s102',"MyCorp",1488411802,110);
insert into shares_info values('s102',"MyCorp",1488411902,90);
insert into shares_info values('s102',"MyCorp",1488412502,80);
insert into shares_info values('s102',"MyCorp",1488411502,120);


commit;












