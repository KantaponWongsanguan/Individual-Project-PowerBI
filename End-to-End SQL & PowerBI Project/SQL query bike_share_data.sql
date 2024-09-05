SELECT * FROM bike_data.bike_share_yr_0;

-- Changing Column Type
-- Convert Date Format Before Changing Column Type

-- Convert dteday to the Correct Format:
ALTER TABLE `bike_data`.`bike_share_yr_0`
ADD COLUMN `dteday_temp` DATE;

UPDATE `bike_data`.`bike_share_yr_0`
SET `dteday_temp` = STR_TO_DATE(`dteday`, '%d/%m/%Y');

-- Check the Converted Data:
SELECT `dteday`, `dteday_temp` FROM `bike_data`.`bike_share_yr_0` LIMIT 10;

-- Drop the Original and rename temp
ALTER TABLE `bike_data`.`bike_share_yr_0`
DROP COLUMN `dteday`,
CHANGE COLUMN `dteday_temp` `dteday` DATE NULL DEFAULT NULL;

-- Change the Other Columns
ALTER TABLE `bike_data`.`bike_share_yr_0`
CHANGE COLUMN `season` `season` INT NULL DEFAULT NULL,
CHANGE COLUMN `yr` `yr` INT NULL DEFAULT NULL,
CHANGE COLUMN `mnth` `mnth` INT NULL DEFAULT NULL,
CHANGE COLUMN `hr` `hr` INT NULL DEFAULT NULL,
CHANGE COLUMN `holiday` `holiday` INT NULL DEFAULT NULL,
CHANGE COLUMN `weekday` `weekday` INT NULL DEFAULT NULL,
CHANGE COLUMN `workingday` `workingday` INT NULL DEFAULT NULL,
CHANGE COLUMN `weathersit` `weathersit` INT NULL DEFAULT NULL,
CHANGE COLUMN `temp` `temp` FLOAT NULL DEFAULT NULL,
CHANGE COLUMN `atemp` `atemp` FLOAT NULL DEFAULT NULL,
CHANGE COLUMN `hum` `hum` FLOAT NULL DEFAULT NULL,
CHANGE COLUMN `windspeed` `windspeed` FLOAT NULL DEFAULT NULL,
CHANGE COLUMN `rider_type` `rider_type` VARCHAR(50) NULL DEFAULT NULL,
CHANGE COLUMN `riders` `riders` INT NULL DEFAULT NULL;

SELECT * FROM bike_share_yr_1;

-- Convert dteday to the Correct Format:
ALTER TABLE `bike_data`.`bike_share_yr_1`
ADD COLUMN `dteday_temp` DATE;

UPDATE `bike_data`.`bike_share_yr_1`
SET `dteday_temp` = STR_TO_DATE(`dteday`, '%d/%m/%Y');

-- Check the Converted Data:
SELECT `dteday`, `dteday_temp` FROM `bike_data`.`bike_share_yr_1` LIMIT 10;

-- Drop the Original and rename temp
ALTER TABLE `bike_data`.`bike_share_yr_1`
DROP COLUMN `dteday`,
CHANGE COLUMN `dteday_temp` `dteday` DATE NULL DEFAULT NULL;

-- Change the Other Columns
ALTER TABLE `bike_data`.`bike_share_yr_1`
CHANGE COLUMN `season` `season` INT NULL DEFAULT NULL,
CHANGE COLUMN `yr` `yr` INT NULL DEFAULT NULL,
CHANGE COLUMN `mnth` `mnth` INT NULL DEFAULT NULL,
CHANGE COLUMN `hr` `hr` INT NULL DEFAULT NULL,
CHANGE COLUMN `holiday` `holiday` INT NULL DEFAULT NULL,
CHANGE COLUMN `weekday` `weekday` INT NULL DEFAULT NULL,
CHANGE COLUMN `workingday` `workingday` INT NULL DEFAULT NULL,
CHANGE COLUMN `weathersit` `weathersit` INT NULL DEFAULT NULL,
CHANGE COLUMN `temp` `temp` FLOAT NULL DEFAULT NULL,
CHANGE COLUMN `atemp` `atemp` FLOAT NULL DEFAULT NULL,
CHANGE COLUMN `hum` `hum` FLOAT NULL DEFAULT NULL,
CHANGE COLUMN `windspeed` `windspeed` FLOAT NULL DEFAULT NULL,
CHANGE COLUMN `rider_type` `rider_type` VARCHAR(50) NULL DEFAULT NULL,
CHANGE COLUMN `riders` `riders` INT NULL DEFAULT NULL;

WITH CTE AS (
	SELECT * FROM bike_share_yr_0 
    UNION 
    SELECT * FROM bike_share_yr_1 
) 
SELECT  dteday, season, CTE.yr, mnth, hr, holiday, weekday, workingday, weathersit, temp, atemp, hum, windspeed, rider_type, riders, cost_table.yr, price, COGS
, riders * price AS revenue, riders * price - COGS AS profit
from CTE 
LEFT JOIN cost_table 
ON CTE.yr = cost_table.yr




