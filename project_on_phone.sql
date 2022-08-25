SELECT * FROM newdb.phones;
alter table phones
change  ï»¿manufacturer  manufacture text;

-- changing name of the column for ure convinient

use newdb;
select * from phones;
select manufacture from phones;

select count(company)
 from(
select distinct(manufacture) as company
from phones
)as x
where x.company is not null;

--  this dataset there are 14 different companies

select distinct manufacture from phones;

select manufacture,model from phones
order by manufacture;

select manufacture, model,x.different_model
from(
    select * ,
    row_number() over(partition by manufacture order by model)as different_model
    from(
    select * from phones)as ph
    )as x
where x.model is not null

/*
Above Query shows that for 'Apple' there are 14 models ,for google and HTC 1 model,for Huawei 6 models ,
for LeTV 1 model, for LG 7 models, for Motorola 5 models, for Nolia 27 models, for oppo 2 models, 
for Palm 1 model, for Research In 1 model, for Samsung 35 models, for Sony Ericsson 3 models
and for Xiaomi 7 models in this dataset.
*/


select count(smartphone) from phones
where smartphone='Yes';

-- above query shows in this dataset there are 76 smartphones

select max(units_sold_m), min(units_sold_m) from phones;

-- from above query we get that maximum unit sold mobile is 250 and minimum unit sold mobile is 2

select * from phones
where units_sold_m = 250;

-- from above query we know that maximun unit sold mobile was 'Nokia - model 1100' on 2003

select * from phones
where units_sold_m = 2;

-- from above query we know that it was two mobile which has minimum unit sold mobile and these two 
--  are 'Palm-model Centro' on 2007 and 'Nokia - model N97' on 2009
 