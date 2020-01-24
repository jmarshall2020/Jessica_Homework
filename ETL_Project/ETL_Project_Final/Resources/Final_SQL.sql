CREATE TABLE etl_project(
	year SERIAL NOT NULL,
	month SERIAL NOT NULL,
	city VARCHAR (50) NOT NULL,
	weather_val VARCHAR (50) NOT NULL,
	arr_flighs FLOAT (50) NOT NULL,
	arr_cancelled FLOAT (50) NOT NULL,
	arr_delay FLOAT (50) NOT NULL,
	carrier_delay FLOAT (50) NOT NULL,
	weather_delay FLOAT (50) NOT NULL
);

SELECT * FROM etl_project