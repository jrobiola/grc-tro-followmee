create or replace function TEAM_ART_DW.FOLLOWMEE.FN_DEVICE_DATA_AGG(P_DATE date)
returns table (
	AS_OF_DATE DATE,
	DEVICE_ID VARCHAR(16777216),
	TRACKER_DATE_BEGIN TIMESTAMP_NTZ(9),
	TRACKER_DATE_END TIMESTAMP_NTZ(9),
	TRACKER_LAT_BEGIN FLOAT,
	TRACKER_LAT_END FLOAT,
	TRACKER_LONG_BEGIN FLOAT,
	TRACKER_LONG_END FLOAT,
	TRACKER_PLANT_ID_BEGIN NUMBER(38,0),
	TRACKER_PLANT_ID_END NUMBER(38,0),
	TRACKER_PLANT_DISTANCE_MS_BEGIN NUMBER(18,2),
	TRACKER_PLANT_DISTANCE_MS_END NUMBER(18,2),
    TRACKER_SPEED_MPH_BEGIN NUMBER(38,0),
    TRACKER_SPEED_MPH_END   NUMBER(38,0),
    TRACKER_DIRECTION_BEGIN NUMBER(38,0),
    TRACKER_DIRECTION_END   NUMBER(38,0),
    TRACKER_ACCURACY        NUMBER(38,0),
    GROUP_NAME              VARCHAR(16777216), 
	TRACKER_SPENT_TIME_MIN NUMBER(18,0),
	TRACKER_TRAVELLED_DISTANCE_MS NUMBER(18,2) 
)
AS
$$
  SELECT s1.*,
         DATEDIFF(minute,TRACKER_DATE_BEGIN,TRACKER_DATE_END) AS TRACKER_SPENT_TIME_MIN,
         (ST_DISTANCE(ST_MAKEPOINT(TRACKER_LONG_BEGIN,TRACKER_LAT_BEGIN),
                     ST_MAKEPOINT(TRACKER_LONG_END,TRACKER_LAT_END)
                    )/1609)::decimal(18,2) AS TRACKER_TRAVELLED_DISTANCE_MS 

  FROM (
    SELECT DD.AS_OF_DATE, 
           DD.DEVICE_ID, 
           LAG(DD.TRACKER_DATE)      OVER (PARTITION BY DD.AS_OF_DATE, DD.DEVICE_ID ORDER BY DD.TRACKER_DATE) AS TRACKER_DATE_BEGIN,
           DD.TRACKER_DATE                                                                                    AS TRACKER_DATE_END,
           LAG(DD.TRACKER_LATITUDE)  OVER (PARTITION BY DD.AS_OF_DATE, DD.DEVICE_ID ORDER BY DD.TRACKER_DATE) AS TRACKER_LAT_BEGIN,
           DD.TRACKER_LATITUDE                                                                                AS TRACKER_LAT_END,
           LAG(DD.TRACKER_LONGITUDE) OVER (PARTITION BY DD.AS_OF_DATE, DD.DEVICE_ID ORDER BY DD.TRACKER_DATE) AS TRACKER_LONG_BEGIN,
           DD.TRACKER_LONGITUDE                                                                               AS TRACKER_LONG_END,
           LAG(DD.PLANT_ID)          OVER (PARTITION BY DD.AS_OF_DATE, DD.DEVICE_ID ORDER BY DD.TRACKER_DATE) AS TRACKER_PLANT_ID_BEGIN,
           DD.PLANT_ID                                                                                        AS TRACKER_PLANT_ID_END,
           LAG(DD.DEVICE_CLOSEST_PLANT_DISTANCE_MS) OVER (PARTITION BY DD.AS_OF_DATE, DD.DEVICE_ID ORDER BY DD.TRACKER_DATE) AS TRACKER_PLANT_DISTANCE_MS_BEGIN,
           DD.DEVICE_CLOSEST_PLANT_DISTANCE_MS AS TRACKER_PLANT_DISTANCE_MS_END,
           LAG(DD.SPEED_MPH) OVER (PARTITION BY DD.AS_OF_DATE, DD.DEVICE_ID ORDER BY DD.TRACKER_DATE) AS TRACKER_SPEED_MPH_BEGIN,
           DD.SPEED_MPH AS TRACKER_SPEED_MPH_END,
           LAG(DD.DIRECTION) OVER (PARTITION BY DD.AS_OF_DATE, DD.DEVICE_ID ORDER BY DD.TRACKER_DATE) AS TRACKER_DIRECTION_BEGIN,
           DD.DIRECTION  AS TRACKER_DIRECTION_END,
           DD.ACCURACY   AS TRACKER_ACCURACY,
           UPPER(DD.GROUP_NAME) AS GROUP_NAME
    FROM TEAM_ART_DW.FOLLOWMEE.DEVICE_DATA_WITH_CLOSEST_PLANT AS DD
    WHERE AS_OF_DATE = P_DATE
  ) AS s1  
$$  