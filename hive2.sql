#creating external tables in hive

create database bank;
use bank;
create external table loan_info_stg(loan_id int,user_id int,last_payement_date string,
payement_installation  double,date_payement  string)
                       row format delimited fields terminated by;
                       location '/bank/loan_info_stg';


create external table credit_card_info_stg(cc_number string,user_id int,maximum_credit double,
outstanding_balance  double,due_date  string)
                       row format delimited fields terminated by;
                       location '/bank/credit_card_info_stg';


create external table shares_info_stg(share_id string, company_name           string,gmt_timestamp date,share_price double)
                       row format delimited fields terminated by;
                       location '/bank/shares_info_stg';



#creating core tables to load data from stg tables

create table loan_info(Loan_id string,User_id string,last_payement_date string,
                      payement_installation  double,date_payement  string)STORED as ORC

create table credit_card_info(cc_number string,user_id int,maximum_credit double,
                       outstanding_balance  double,due_date  string)STORED as ORC

create table shares_info(share_id string, company_name           
                    string,gmt_timestamp date,share_price double)STORED as ORC


#loading data into these core tables

insert into table loan_info select loan_id,user_id,payement_installation,date_payement from loan_info stg;

insert into table credit_card_info select cc_number,user_id,maximum_credit,outstanding_balance,due_date from credit_card_info_stg;

insert into table shares_info select share_id,company_name,gmt_timestamp,share_price from shares.info_stg;


#analysis

select user_id from loan_info where datediff(from unixtime(unix_timestamp(),'yy-MM-dd'),last_payement_date>)=60;


select loan_info.user_id
                        from loan_info inner join credit_card_info
                        on loan_info.user_id==credit_card_info.user_id
                        where cast(credit_card_info.outstanding_balance)as double)=0.0
                        and datediff(from unixtime(unix_timestamp(),'yy-MM-dd'),loan_info.last_payement_date)>=30;








