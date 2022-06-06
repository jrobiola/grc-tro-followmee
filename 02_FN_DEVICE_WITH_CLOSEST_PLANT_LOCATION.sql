create or replace function TEAM_ART_DW.FOLLOWMEE.FN_DEVICE_DATA_WITH_CLOSEST_PLANT (P_DATE date)
returns table (
AS_OF_DATE                       DATE,
DEVICE_ID                        VARCHAR(16777216),
TRACKER_DATE                     TIMESTAMP_NTZ(9),  
TRACKER_LATITUDE                 FLOAT,
TRACKER_LONGITUDE                FLOAT,
SPEED_MPH                        NUMBER(38,0),
DIRECTION                        NUMBER(38,0),
ACCURACY                         NUMBER(38,0),
GROUP_NAME                       VARCHAR(16777216),
PLANT_ID                         NUMBER(2,0),
DEVICE_CLOSEST_PLANT_DISTANCE_MS DECIMAL(18,2)
) AS
--SELECT fn.* FROM TABLE( TEAM_ART_DW.FOLLOWMEE.FN_DEVICE_DATA_WITH_CLOSEST_PLANT('2022-04-26'::DATE) ) AS fn ;
$$
  WITH cte_values AS (
    SELECT s1.DEVICE_ID, s1.DATE, s1.LATITUDE, s1.LONGITUDE, 
           s1.SPEED_MPH, s1.DIRECTION, s1.ACCURACY, s1.GROUP_NAME,
           [gps_distance_plant_1_ms,gps_distance_plant_2_ms,gps_distance_plant_3_ms,gps_distance_plant_4_ms,gps_distance_plant_5_ms,gps_distance_plant_6_ms,gps_distance_plant_7_ms,gps_distance_plant_8_ms,gps_distance_plant_9_ms,gps_distance_plant_10_ms,gps_distance_plant_11_ms,gps_distance_plant_12_ms,gps_distance_plant_13_ms,gps_distance_plant_14_ms,gps_distance_plant_15_ms,gps_distance_plant_16_ms,gps_distance_plant_17_ms,gps_distance_plant_18_ms,gps_distance_plant_19_ms,gps_distance_plant_20_ms,gps_distance_plant_21_ms,gps_distance_plant_22_ms,gps_distance_plant_23_ms,gps_distance_plant_24_ms,gps_distance_plant_25_ms,gps_distance_plant_26_ms,gps_distance_plant_27_ms,gps_distance_plant_28_ms,gps_distance_plant_29_ms,gps_distance_plant_30_ms,gps_distance_plant_31_ms,gps_distance_plant_31_ms,gps_distance_plant_33_ms,gps_distance_plant_34_ms,gps_distance_plant_35_ms,gps_distance_plant_36_ms] as gps_distances_arr  
    FROM (
      SELECT d.DEVICE_ID, d.DATE, d.LATITUDE, d.LONGITUDE, d.SPEED_MPH, d.DIRECTION, d.ACCURACY, d.GROUP_NAME,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_1_LAT, d.LONGITUDE, pl.PLANT_1_LONG)::decimal(18,2) AS gps_distance_plant_1_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_2_LAT, d.LONGITUDE, pl.PLANT_2_LONG)::decimal(18,2) AS gps_distance_plant_2_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_3_LAT, d.LONGITUDE, pl.PLANT_3_LONG)::decimal(18,2) AS gps_distance_plant_3_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_4_LAT, d.LONGITUDE, pl.PLANT_4_LONG)::decimal(18,2) AS gps_distance_plant_4_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_5_LAT, d.LONGITUDE, pl.PLANT_5_LONG)::decimal(18,2) AS gps_distance_plant_5_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_6_LAT, d.LONGITUDE, pl.PLANT_6_LONG)::decimal(18,2) AS gps_distance_plant_6_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_7_LAT, d.LONGITUDE, pl.PLANT_7_LONG)::decimal(18,2) AS gps_distance_plant_7_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_8_LAT, d.LONGITUDE, pl.PLANT_8_LONG)::decimal(18,2) AS gps_distance_plant_8_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_9_LAT, d.LONGITUDE, pl.PLANT_9_LONG)::decimal(18,2) AS gps_distance_plant_9_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_10_LAT, d.LONGITUDE, pl.PLANT_10_LONG)::decimal(18,2) AS gps_distance_plant_10_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_11_LAT, d.LONGITUDE, pl.PLANT_11_LONG)::decimal(18,2) AS gps_distance_plant_11_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_12_LAT, d.LONGITUDE, pl.PLANT_12_LONG)::decimal(18,2) AS gps_distance_plant_12_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_13_LAT, d.LONGITUDE, pl.PLANT_13_LONG)::decimal(18,2) AS gps_distance_plant_13_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_14_LAT, d.LONGITUDE, pl.PLANT_14_LONG)::decimal(18,2) AS gps_distance_plant_14_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_15_LAT, d.LONGITUDE, pl.PLANT_15_LONG)::decimal(18,2) AS gps_distance_plant_15_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_16_LAT, d.LONGITUDE, pl.PLANT_16_LONG)::decimal(18,2) AS gps_distance_plant_16_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_17_LAT, d.LONGITUDE, pl.PLANT_17_LONG)::decimal(18,2) AS gps_distance_plant_17_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_18_LAT, d.LONGITUDE, pl.PLANT_18_LONG)::decimal(18,2) AS gps_distance_plant_18_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_19_LAT, d.LONGITUDE, pl.PLANT_19_LONG)::decimal(18,2) AS gps_distance_plant_19_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_20_LAT, d.LONGITUDE, pl.PLANT_20_LONG)::decimal(18,2) AS gps_distance_plant_20_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_21_LAT, d.LONGITUDE, pl.PLANT_21_LONG)::decimal(18,2) AS gps_distance_plant_21_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_22_LAT, d.LONGITUDE, pl.PLANT_22_LONG)::decimal(18,2) AS gps_distance_plant_22_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_23_LAT, d.LONGITUDE, pl.PLANT_23_LONG)::decimal(18,2) AS gps_distance_plant_23_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_24_LAT, d.LONGITUDE, pl.PLANT_24_LONG)::decimal(18,2) AS gps_distance_plant_24_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_25_LAT, d.LONGITUDE, pl.PLANT_25_LONG)::decimal(18,2) AS gps_distance_plant_25_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_26_LAT, d.LONGITUDE, pl.PLANT_26_LONG)::decimal(18,2) AS gps_distance_plant_26_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_27_LAT, d.LONGITUDE, pl.PLANT_27_LONG)::decimal(18,2) AS gps_distance_plant_27_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_28_LAT, d.LONGITUDE, pl.PLANT_28_LONG)::decimal(18,2) AS gps_distance_plant_28_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_29_LAT, d.LONGITUDE, pl.PLANT_29_LONG)::decimal(18,2) AS gps_distance_plant_29_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_30_LAT, d.LONGITUDE, pl.PLANT_30_LONG)::decimal(18,2) AS gps_distance_plant_30_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_31_LAT, d.LONGITUDE, pl.PLANT_31_LONG)::decimal(18,2) AS gps_distance_plant_31_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_32_LAT, d.LONGITUDE, pl.PLANT_32_LONG)::decimal(18,2) AS gps_distance_plant_32_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_33_LAT, d.LONGITUDE, pl.PLANT_33_LONG)::decimal(18,2) AS gps_distance_plant_33_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_34_LAT, d.LONGITUDE, pl.PLANT_34_LONG)::decimal(18,2) AS gps_distance_plant_34_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_35_LAT, d.LONGITUDE, pl.PLANT_35_LONG)::decimal(18,2) AS gps_distance_plant_35_ms,
      GET_GPS_distance(d.LATITUDE, pl.PLANT_36_LAT, d.LONGITUDE, pl.PLANT_36_LONG)::decimal(18,2) AS gps_distance_plant_36_ms 
      FROM SLATECO_DW.FOLLOWMEE.DEVICE_DATA AS d 
      CROSS JOIN TEAM_ART_DW.FOLLOWMEE.VW_GET_PLANT_LOCATIONS pl
      WHERE CAST(d.DATE AS DATE) = P_DATE
    ) s1
  )
  SELECT s2.AS_OF_DATE,s2.DEVICE_ID, s2.DATE AS TRACKER_DATE, s2.TRACKER_LATITUDE, s2.TRACKER_LONGITUDE, 
         s2.SPEED_MPH, s2.DIRECTION, s2.ACCURACY, s2.GROUP_NAME,
         s2.PLANT_ID,  s2.DEVICE_CLOSEST_PLANT_DISTANCE_MS 
  FROM (
    SELECT CAST( cte.DATE AS DATE ) AS AS_OF_DATE, cte.DEVICE_ID, cte.DATE, 
           cte.LATITUDE AS TRACKER_LATITUDE, cte.LONGITUDE AS TRACKER_LONGITUDE, 
           cte.SPEED_MPH, cte.DIRECTION, cte.ACCURACY, cte.GROUP_NAME,
           f.INDEX + 1 AS PLANT_ID, f.VALUE::decimal(18,2) AS DEVICE_CLOSEST_PLANT_DISTANCE_MS,
           ROW_NUMBER() OVER ( PARTITION BY cte.DEVICE_ID, cte.DATE ORDER BY f.VALUE ASC ) AS RN
    FROM   cte_values AS cte, LATERAL FLATTEN( cte.gps_distances_arr ) AS f
  ) s2
  WHERE s2.RN = 1 
  ORDER BY 1,2,3
$$


