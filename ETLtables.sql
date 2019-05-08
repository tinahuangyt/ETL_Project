## Creating fresh database and tables to store data from pandas dataframe.
create database shot_chicago;
use shot_chicago;

## Extra command to drop the table when required
# drop table chicrimes;

## The table elements are the same as the ones in the dataframe- saved as desired types
/* create table chicrime(
`ID` bigint(20),
`Date` date,
`Primary Type` varchar(50),
`Location Description` varchar(200),
`Arrest` boolean,
`Community Area` integer,
`Year` integer,
`Latitude` double,
`Longitude` double,
`Time` time,
`AmPm` varchar(3)
); */

select c.percent_unemployed, c.percent_working, count(cc.ID) as Crime_count , c.total_population, c.median_income, count(cc.ID)*100/c.total_population as Crime_rate
from census as c
left join chicrime as cc
on c.community_area_number = cc.`Community Area`
where cc.`Year` = 2015 
group by cc.`Community Area`
order by `Crime_count`;

select distinct `Primary Type`
from chicrime;

select sum(case when cc.`Primary Type` = `WEAPONS VIOLATION` then 1 else 0 end)/count(cc.ID) *100 as percent_shoot, count(cc.ID)*100/c.total_population as Crime_rate
from census as c
left join chicrime as cc
on c.community_area_number = cc.`Community Area`
where cc.`Year` = 2015 
group by cc.`Community Area`
order by `Crime_rate`;



select c.total_population, count(f.`Postal Code`) as `Flushot centres`, c.community_area_number, c.Area
from census as c
left join flushot as f
on c.community_area_number = f.community_area_number
where f.`Year` = 2015 
group by c.community_area_number
order by c.total_population;

select * from ce
