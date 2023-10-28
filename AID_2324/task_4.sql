DROP DATABASE IF EXISTS task_4;
CREATE DATABASE task_4;
USE task_4;
-- Create the Time Dimension
CREATE TABLE dim_time (
    TIME_ID INT,
    YEAR INT,
    MONTH INT,
    PRIMARY KEY (TIME_ID)
);

-- Create the Location Dimension
CREATE TABLE dim_location (
    LOCATION_ID INT,
    DISTRICT VARCHAR(255),
    MUNICIPALITY VARCHAR(255),
    PARISH VARCHAR(255),
    PRIMARY KEY (LOCATION_ID)
);

-- Create the Voltage Dimension
CREATE TABLE dim_voltage (
    VOLTAGE_ID INT,
    `Voltage level` VARCHAR(255), -- Adjust column name and use backticks if it contains spaces
	PRIMARY KEY (VOLTAGE_ID)
);

-- Create the Fact Table
CREATE TABLE fact_energy_consumption (
	FACT_ID INT,
    TIME_ID INT,
    LOCATION_ID INT,
    VOLTAGE_ID INT,
    Active_Energy DECIMAL(10, 2), -- Adjust data type as needed
    PRIMARY KEY (FACT_ID),
    FOREIGN KEY (TIME_ID) REFERENCES dim_time (TIME_ID),
    FOREIGN KEY (LOCATION_ID) REFERENCES dim_location (LOCATION_ID),
    FOREIGN KEY (VOLTAGE_ID) REFERENCES dim_voltage (VOLTAGE_ID)
);
