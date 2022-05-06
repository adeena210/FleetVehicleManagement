/*These queries are templates for transactions that can be applied to this database*/
SELECT Vehicle_Type
FROM VEHICLE;

SELECT * 
FROM VEHICLE_COSTS
WHERE VEHICLE_TYPE = 'Your_Example_Vehicle_type' AND EMISSIONS_TYPE = 'Zero';

SELECT * 
FROM VEHICLE_EMISSIONS
WHERE VEHICLE_TYPE = 'Your_Example_Vehicle_type' AND EMISSIONS_TYPE = 'Zero';

UPDATE VEHICLE
    SET Miles_per_gallon = 0
    WHERE VEHICLE_TYPE='Your_Example_Vehicle_type' AND EMISSIONS_TYPE= 'Zero';

UPDATE COSTS
    SET Battery = 0
    WHERE VEHICLE_TYPE='Your_Example_Vehicle_type' AND EMISSIONS_TYPE= 'Zero';

UPDATE EMISSIONS
    SET ECE = 0
    WHERE VEHICLE_TYPE='Your_Example_Vehicle_type' AND EMISSIONS_TYPE= 'Zero';

DELETE FROM COST 
WHERE VEHICLE_TYPE='Your_Example_Vehicle_type' AND EMISSIONS_TYPE= 'Zero';

DELETE FROM EMISSIONS 
WHERE VEHICLE_TYPE='Your_Example_Vehicle_type' AND EMISSIONS_TYPE= 'Zero';

DELETE FROM VEHICLE 
WHERE VEHICLE_TYPE='Your_Example_Vehicle_type' AND EMISSIONS_TYPE= 'Zero';

INSERT INTO VEHICLE (Vehicle_type, Emissions_type, Anticipated_mileage,
Miles_per_gallon)
VALUES ('Your_Example_Vehicle_type','Zero',0,0);

INSERT INTO COST (Vehicle_type, Emissions_type, Initial_capital, Fuel_cost_per_mile, Battery, Insurance, Repair, Maintenance_cost_per_mile)
VALUES ('Your_Example_Vehicle_type','Zero',0,0,0,0,0,0);

INSERT INTO EMISSIONS (Vehicle_type, Emissions_type, ECE)
VALUES('Your_Example_Vehicle_type','Zero',0;
SELECT Vehicle_Type
FROM VEHICLE;

SELECT * 
FROM VEHICLE_COSTS
WHERE VEHICLE_TYPE = 'Your_Example_Vehicle_type' AND EMISSIONS_TYPE = 'Zero';

SELECT * 
FROM VEHICLE_EMISSIONS
WHERE VEHICLE_TYPE = 'Your_Example_Vehicle_type' AND EMISSIONS_TYPE = 'Zero';
UPDATE VEHICLE
    SET Miles_per_gallon = 0
    WHERE VEHICLE_TYPE='Your_Example_Vehicle_type' AND EMISSIONS_TYPE= 'Zero';

UPDATE COST
    SET Battery = 0
    WHERE VEHICLE_TYPE='Your_Example_Vehicle_type' AND EMISSIONS_TYPE= 'Zero';

UPDATE EMISSIONS
    SET ECE = 0
    WHERE VEHICLE_TYPE='Your_Example_Vehicle_type' AND EMISSIONS_TYPE= 'Zero';

DELETE FROM COST 
WHERE VEHICLE_TYPE='Your_Example_Vehicle_type' AND EMISSIONS_TYPE= 'Zero';

DELETE FROM EMISSIONS 
WHERE VEHICLE_TYPE='Your_Example_Vehicle_type' AND EMISSIONS_TYPE= 'Zero';

DELETE FROM VEHICLE 
WHERE VEHICLE_TYPE='Your_Example_Vehicle_type' AND EMISSIONS_TYPE= 'Zero';

INSERT INTO VEHICLE (Vehicle_type, Emissions_type, Anticipated_mileage,
Miles_per_gallon)
VALUES ('Your_Example_Vehicle_type','Zero',0,0);

INSERT INTO COST (Vehicle_type, Emissions_type, Initial_capital, Fuel_cost_per_mile, Battery, Insurance, Repair, Maintenance_cost_per_mile)
VALUES ('Your_Example_Vehicle_type','Zero',0,0,0,0,0,0);

INSERT INTO EMISSIONS (Vehicle_type, Emissions_type, ECE)
VALUES('Your_Example_Vehicle_type','Zero',0);

/*\s transactions.sql */
