create database Air_cargo_analysis;
use Air_cargo_Analysis;
select * from customer;
select * from passengers_on_flights;
select * from routes;
select * from ticket_details;
create table route_details1(route_id int primary key auto_increment, flight_num int check (flight_num>0),origin_airport varchar(20),destination_airport varchar(20),aircraft_id varchar(30),distance_mile int check(distance_mile>0));
select * from route_details1;	
select customer.first_name, passengers_on_flights.route_id from customer inner join passengers_on_flights on customer.customer_id=passengers_on_flights.customer_id where route_id >= 1 and route_id <=25 order by route_id;
select class_id as class,count(customer_id)as number_of_customer ,sum(price_per_ticket)as Total_Revenue from ticket_details group by class_id having class_id= "bussiness";
select concat(first_name," ",last_name) as customer_full_name from customer;
select customer.first_name, ticket_details.no_of_tickets from customer inner join ticket_details on customer.customer_id=ticket_details.customer_id;
select customer.first_name,customer.last_name,ticket_details.brand from customer inner join ticket_details on  customer.customer_id=ticket_details.customer_id where brand = "Emirates";
select class_id, count(customer_id)as number_of_customer from passengers_on_flights group by class_id having class_id="Economy Plus";
select if(sum(price_per_ticket)>10000,"Revenue crossed 10000", "not crossed 10000")as Revenue from ticket_details;
create user if not exists user1 identified by "123456";
grant all privileges on *.* to user1;
select max(price_per_ticket)as maximum_ticket_price from ticket_details;
select ct.first_name,pof.route_id from customer as ct inner join passengers_on_flights as pof on ct.customer_id=pof.customer_id where route_id =4;
select travel_date, depart, arrival from passengers_on_flights where route_id = 4;
select aircraft_id, sum(price_per_ticket)as overall_price_per_ticket from ticket_details group by aircraft_id with rollup;
create view Business_class as select class_id, brand from ticket_details where class_id = "Bussiness";
DELIMITER %%
create procedure passengers_detail4() 
begin 
select passengers_on_flights.customer_id, passengers_on_flights.route_id, routes.route_id, routes.distance_miles from passengers_on_flights inner join routes on passengers_on_flights.customer_id=routes.route_id;
end %%

DELIMITER %%
create procedure route_distance()
begin
select * from routes where distance_miles >2000;
end%%

call passengers_detail4();
call route_distance();

DELIMITER %%
create procedure distance_travel_category1()
begin
select flight_num as SDT from routes where distance_miles >=0 and distance_miles <= 2000;
select flight_num as IDT from routes where distance_miles >=2000 and distance_miles <= 6500;
select flight_num as LDT from routes where distance_miles > 6500;
end
%%
call distance_travel_category1();
select first_name ,last_name from customer where last_name ="Scott";


