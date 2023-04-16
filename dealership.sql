CREATE TABLE "car" (
  "vin" SERIAL PRIMARY KEY,
  "serial_number" INTEGER,
  "model_year" INTEGER,
  "body_type" INTEGER,
  "brand_name" INTEGER,
  "color" VARCHAR(60),
  "year" INTEGER,
  "car_for_sale" BOOLEAN,
  "car_for_service" BOOLEAN
);


CREATE TABLE "sales agent" (
  "agent_id" SERIAL,
  "first_name" VARCHAR(60),
  "last_name" VARCHAR(60),
  "number" INTEGER,
  "address" VARCHAR(60),
  "email" VARCHAR(60),
  PRIMARY KEY ("agent_id")
);
ALTER TABLE "sales agent"
RENAME TO "sales_agent";

ALTER TABLE "sales_agent"
ALTER COLUMN "number" TYPE numeric;

CREATE TABLE "sales_invoice" (
  "sales_id" INTEGER,
  "customer_id" INTEGER,
  "vin" INTEGER,
  "date" DATE,
  "price" NUMERIC,
  "agnet_id" INTEGER,
    FOREIGN KEY ("vin")
      REFERENCES "sales_agent"("agent_id"),
    FOREIGN KEY ("vin")
      REFERENCES "car"("vin")
);



CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "work_at" VARCHAR(60),
  "first_name" VARCHAR(60),
  "last_name" VARCHAR(60),
  "address" VARCHAR(60),
  "city" INTEGER,
  "state" VARCHAR(60),
  "country" VARCHAR(60),
  "zipcode" INTEGER,
  "gender" VARCHAR(60),
  "annual_income" INTEGER,
  "agent_id" INTEGER,
  PRIMARY KEY ("customer_id")
);

ALTER TABLE "customer"
ALTER COLUMN "gender" TYPE VARCHAR(60);

CREATE TABLE "service_invoice" (
  "service_ticket_num" SERIAL,
  "car_id" INTEGER,
  "custormer_id" INTEGER,
  "date_received" DATE,
  "date_returned" DATE,
  "comments" VARCHAR(60),
  "hourly_rate" NUMERIC,
  "serviced_date" DATE,
  "serviced_mec_id" INTEGER,
  "vin" INT,
  PRIMARY KEY ("service_ticket_num")
);

CREATE INDEX "fk" ON  "service_invoice" ("serviced_mec_id");

CREATE TABLE "mechanic" (
  "mechanic_id" SERIAL,
  "first_name" VARCHAR(60),
  "last_name" VARCHAR(60),
  "hour_work" INTEGER,
  PRIMARY KEY ("mechanic_id")
);


INSERT INTO car
VALUES (
	DEFAULT, 
	'166344', 
	'2011',	
	'SALON',	
	'mercedes',
	'grey',
	'FALSE',
	'TRUE',
	'FALSE'
),(
	DEFAULT,
	'166400', 
	'2012',	
	'SALON',	
	'mercedes',
	'green',
	'FALSE',
	'TRUE',
	'FALSE'
)

INSERT INTO car
VALUES (
	DEFAULT, 
	'166344', 
	'2011',	
	'SALON',	
	'mercedes',
	'grey',
	'FALSE',
	'TRUE',
	'FALSE'
),(
	DEFAULT,
	'166400', 
	'2012',	
	'SALON',	
	'mercedes',
	'green',
	'FALSE',
	'TRUE',
	'FALSE'
)


CREATE or replace PROCEDURE car_for_service(vin_num INT
	
)
LANGUAGE plpgsql 
AS $$ 
BEGIN
		
		 UPDATE car SET car_for_service = TRUE, is_servised = TRUE
         WHERE vin = vin_num AND is_servised = FALSE;	
			
	
		  COMMIT;
END;
$$;

CALL car_for_service(4)

SELECT *
FROM sales_agent

--good
INSERT INTO customer
VALUES (
	DEFAULT, 
	'Dealership1', 
	'Mia',	
	'Ciaria',	
	'189 Lyon ave',
	'Newark',
	'New Jersey',
	'USA',
	'11910',
	'F'
	'185,000',
	'003'
),( 
	DEFAULT, 
	'Dealership2', 
	'Mary',	
	'Williams',	
	'389 Union ave',
	'Irvington',
	'New Jersey',
	'USA',
	'08011',
	'F',
	'160,000',
	 '003'
)


INSERT INTO sales_invoice
VALUES (
	DEFAULT,
	DEFAULT,
	'2'
	'1',
	'02-10-2020',
	
);

INSERT INTO "sales_invoice" ("sales_id", "customer_id", "vin", "date", "price", "agnet_id")
VALUES (DEFAULT, 4, 4, '2021-02-05', 10000.00, 3);



SELECT * FROM "car";

ALTER TABLE "sales_agent"
ALTER COLUMN "address" TYPE VARCHAR(60);












