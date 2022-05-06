CREATE TABLE VEHICLE (
Vehicle_type VARCHAR(255),
Emissions_type VARCHAR(255),
Anticipated_mileage INT,
Miles_per_gallon INT,
PRIMARY KEY (Vehicle_type, Emissions_type)
);

/*
In order to add to the table Vehicle, copy and paste the below example insert query, replacing the placeholder values with actual values
*/

INSERT INTO VEHICLE (Vehicle_type, Emissions_type, Anticipated_mileage,
Miles_per_gallon)
VALUES ('Your_Example_Vehicle_type','ICE/Hybrid/Zero',0,0);

select * from vehicle;
CREATE TABLE COST (
Vehicle_type  VARCHAR(255),
Emissions_type  VARCHAR(255),
Initial_capital INT,
Fuel_cost_per_mile float(2),
Battery INT,
Insurance INT,
Repair INT,
Maintenance_cost_per_mile float(2),
PRIMARY KEY (Vehicle_type, Emissions_type)
);

ALTER TABLE COST
ADD FOREIGN KEY (Vehicle_type, Emissions_type) REFERENCES VEHICLE(Vehicle_type, Emissions_type)
ON DELETE CASCADE ON UPDATE CASCADE;

/*
In order to add to the table Cost, copy and paste the below example insert query, replacing the placeholder values with actual values
*/
INSERT INTO COST (Vehicle_type, Emissions_type, Initial_capital, Fuel_cost_per_mile, Battery, Insurance, Repair, Maintenance_cost_per_mile)
VALUES ('Your_Example_Vehicle_type','ICE/Hybrid/Zero',0,0,0,0,0,0);


select * from cost;
CREATE TABLE EMISSIONS (
Vehicle_type  VARCHAR(255),
Emissions_type  VARCHAR(255),
ECE float(2),
PRIMARY KEY (Vehicle_type, Emissions_type)
);

ALTER TABLE EMISSIONS
ADD FOREIGN KEY (Vehicle_type, Emissions_type) REFERENCES VEHICLE(Vehicle_type, Emissions_type)
ON DELETE CASCADE ON UPDATE CASCADE;

/*
In order to add to the table Emissions, copy and paste the below example insert query, replacing the placeholder values with actual values
*/
INSERT INTO EMISSIONS (Vehicle_type, Emissions_type, ECE)
VALUES('Your_Example_Vehicle_type','ICE/Hybrid/Zero',0);


select * from emissions;
CREATE VIEW VEHICLE_COSTS AS
SELECT * 
FROM COST
NATURAL JOIN VEHICLE;

CREATE VIEW VEHICLE_EMISSIONS AS
SELECT * 
FROM EMISSIONS
NATURAL JOIN VEHICLE;
select * from vehicle_costs;
select * from vehicle_emissions;

CREATE VIEW VEHICLE_COSTS_EMISSIONS AS
SELECT * 
FROM VEHICLE_EMISSIONS
NATURAL JOIN VEHICLE_COSTS;
/*\s create.sql */
