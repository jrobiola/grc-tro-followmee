create or replace view TEAM_ART_DW.FOLLOWMEE.VW_GET_PLANT_LOCATIONS(
	PLANT_1_LONG,
	PLANT_1_LAT,
	PLANT_2_LONG,
	PLANT_2_LAT,
	PLANT_3_LONG,
	PLANT_3_LAT,
	PLANT_4_LONG,
	PLANT_4_LAT,
	PLANT_5_LONG,
	PLANT_5_LAT,
	PLANT_6_LONG,
	PLANT_6_LAT,
	PLANT_7_LONG,
	PLANT_7_LAT,
	PLANT_8_LONG,
	PLANT_8_LAT,
	PLANT_9_LONG,
	PLANT_9_LAT,
	PLANT_10_LONG,
	PLANT_10_LAT,
	PLANT_11_LONG,
	PLANT_11_LAT,
	PLANT_12_LONG,
	PLANT_12_LAT,
	PLANT_13_LONG,
	PLANT_13_LAT,
	PLANT_14_LONG,
	PLANT_14_LAT,
	PLANT_15_LONG,
	PLANT_15_LAT,
	PLANT_16_LONG,
	PLANT_16_LAT,
	PLANT_17_LONG,
	PLANT_17_LAT,
	PLANT_18_LONG,
	PLANT_18_LAT,
	PLANT_19_LONG,
	PLANT_19_LAT,
	PLANT_20_LONG,
	PLANT_20_LAT,
	PLANT_21_LONG,
	PLANT_21_LAT,
	PLANT_22_LONG,
	PLANT_22_LAT,
	PLANT_23_LONG,
	PLANT_23_LAT,
	PLANT_24_LONG,
	PLANT_24_LAT,
	PLANT_25_LONG,
	PLANT_25_LAT,
	PLANT_26_LONG,
	PLANT_26_LAT,
	PLANT_27_LONG,
	PLANT_27_LAT,
	PLANT_28_LONG,
	PLANT_28_LAT,
	PLANT_29_LONG,
	PLANT_29_LAT,
	PLANT_30_LONG,
	PLANT_30_LAT,
	PLANT_31_LONG,
	PLANT_31_LAT,
	PLANT_32_LONG,
	PLANT_32_LAT,
	PLANT_33_LONG,
	PLANT_33_LAT,
	PLANT_34_LONG,
	PLANT_34_LAT,
	PLANT_35_LONG,
	PLANT_35_LAT,
	PLANT_36_LONG,
	PLANT_36_LAT
) as 
select  
   substring( location_1, 1, charindex(';',location_1)-1)  as plant_1_long,substring( location_1, charindex(';',location_1)+1, 30) as plant_1_lat
  ,substring( location_2, 1, charindex(';',location_2)-1) as plant_2_long,substring( location_2, charindex(';',location_2)+1, 30) AS plant_2_lat
  ,substring( location_3, 1, charindex(';',location_3)-1) as plant_3_long,substring( location_3, charindex(';',location_3)+1, 30) AS plant_3_lat
  ,substring( location_4, 1, charindex(';',location_4)-1) as plant_4_long,substring( location_4, charindex(';',location_4)+1, 30) AS plant_4_lat
  ,substring( location_5, 1, charindex(';',location_5)-1) as plant_5_long,substring( location_5, charindex(';',location_5)+1, 30) AS plant_5_lat
  ,substring( location_6, 1, charindex(';',location_6)-1) as plant_6_long,substring( location_6, charindex(';',location_6)+1, 30) AS plant_6_lat
  ,substring( location_7, 1, charindex(';',location_7)-1) as plant_7_long,substring( location_7, charindex(';',location_7)+1, 30) AS plant_7_lat
  ,substring( location_8, 1, charindex(';',location_8)-1) as plant_8_long,substring( location_8, charindex(';',location_8)+1, 30) AS plant_8_lat
  ,substring( location_9, 1, charindex(';',location_9)-1) as plant_9_long,substring( location_9, charindex(';',location_9)+1, 30) AS plant_9_lat
  ,substring( location_10, 1, charindex(';',location_10)-1) as plant_10_long,substring( location_10, charindex(';',location_10)+1, 30) AS plant_10_lat
  ,substring( location_11, 1, charindex(';',location_11)-1) as plant_11_long,substring( location_11, charindex(';',location_11)+1, 30) AS plant_11_lat
  ,substring( location_12, 1, charindex(';',location_12)-1) as plant_12_long,substring( location_12, charindex(';',location_12)+1, 30) AS plant_12_lat
  ,substring( location_13, 1, charindex(';',location_13)-1) as plant_13_long,substring( location_13, charindex(';',location_13)+1, 30) AS plant_13_lat
  ,substring( location_14, 1, charindex(';',location_14)-1) as plant_14_long,substring( location_14, charindex(';',location_14)+1, 30) AS plant_14_lat
  ,substring( location_15, 1, charindex(';',location_15)-1) as plant_15_long,substring( location_15, charindex(';',location_15)+1, 30) AS plant_15_lat
  ,substring( location_16, 1, charindex(';',location_16)-1) as plant_16_long,substring( location_16, charindex(';',location_16)+1, 30) AS plant_16_lat
  ,substring( location_17, 1, charindex(';',location_17)-1) as plant_17_long,substring( location_17, charindex(';',location_17)+1, 30) AS plant_17_lat
  ,substring( location_18, 1, charindex(';',location_18)-1) as plant_18_long,substring( location_18, charindex(';',location_18)+1, 30) AS plant_18_lat
  ,substring( location_19, 1, charindex(';',location_19)-1) as plant_19_long,substring( location_19, charindex(';',location_19)+1, 30) AS plant_19_lat
  ,substring( location_20, 1, charindex(';',location_20)-1) as plant_20_long,substring( location_20, charindex(';',location_20)+1, 30) AS plant_20_lat
  ,substring( location_21, 1, charindex(';',location_21)-1) as plant_21_long,substring( location_21, charindex(';',location_21)+1, 30) AS plant_21_lat
  ,substring( location_22, 1, charindex(';',location_22)-1) as plant_22_long,substring( location_22, charindex(';',location_22)+1, 30) AS plant_22_lat
  ,substring( location_23, 1, charindex(';',location_23)-1) as plant_23_long,substring( location_23, charindex(';',location_23)+1, 30) AS plant_23_lat
  ,substring( location_24, 1, charindex(';',location_24)-1) as plant_24_long,substring( location_24, charindex(';',location_24)+1, 30) AS plant_24_lat
  ,substring( location_25, 1, charindex(';',location_25)-1) as plant_25_long,substring( location_25, charindex(';',location_25)+1, 30) AS plant_25_lat
  ,substring( location_26, 1, charindex(';',location_26)-1) as plant_26_long,substring( location_26, charindex(';',location_26)+1, 30) AS plant_26_lat
  ,substring( location_27, 1, charindex(';',location_27)-1) as plant_27_long,substring( location_27, charindex(';',location_27)+1, 30) AS plant_27_lat
  ,substring( location_28, 1, charindex(';',location_28)-1) as plant_28_long,substring( location_28, charindex(';',location_28)+1, 30) AS plant_28_lat
  ,substring( location_29, 1, charindex(';',location_29)-1) as plant_29_long,substring( location_29, charindex(';',location_29)+1, 30) AS plant_29_lat
  ,substring( location_30, 1, charindex(';',location_30)-1) as plant_30_long,substring( location_30, charindex(';',location_30)+1, 30) AS plant_30_lat
  ,substring( location_31, 1, charindex(';',location_31)-1) as plant_31_long,substring( location_31, charindex(';',location_31)+1, 30) AS plant_31_lat
  ,substring( location_32, 1, charindex(';',location_32)-1) as plant_32_long,substring( location_32, charindex(';',location_32)+1, 30) AS plant_32_lat
  ,substring( location_33, 1, charindex(';',location_33)-1) as plant_33_long,substring( location_33, charindex(';',location_33)+1, 30) AS plant_33_lat
  ,substring( location_34, 1, charindex(';',location_34)-1) as plant_34_long,substring( location_34, charindex(';',location_34)+1, 30) AS plant_34_lat
  ,substring( location_35, 1, charindex(';',location_35)-1) as plant_35_long,substring( location_35, charindex(';',location_35)+1, 30) AS plant_35_lat
  ,substring( location_36, 1, charindex(';',location_36)-1) as plant_36_long,substring( location_36, charindex(';',location_36)+1, 30) AS plant_36_lat
 from (
  select SPLIT_PART( GPS_POINTS, '|', 1) AS location_1 
        ,SPLIT_PART( GPS_POINTS, '|', 2) AS location_2
        ,SPLIT_PART( GPS_POINTS, '|', 3) AS location_3
        ,SPLIT_PART( GPS_POINTS, '|', 4) AS location_4
        ,SPLIT_PART( GPS_POINTS, '|', 5) AS location_5
        ,SPLIT_PART( GPS_POINTS, '|', 6) AS location_6
        ,SPLIT_PART( GPS_POINTS, '|', 7) AS location_7
        ,SPLIT_PART( GPS_POINTS, '|', 8) AS location_8
        ,SPLIT_PART( GPS_POINTS, '|', 9) AS location_9
        ,SPLIT_PART( GPS_POINTS, '|', 10) AS location_10
        ,SPLIT_PART( GPS_POINTS, '|', 11) AS location_11
        ,SPLIT_PART( GPS_POINTS, '|', 12) AS location_12
        ,SPLIT_PART( GPS_POINTS, '|', 13) AS location_13
        ,SPLIT_PART( GPS_POINTS, '|', 14) AS location_14
        ,SPLIT_PART( GPS_POINTS, '|', 15) AS location_15
        ,SPLIT_PART( GPS_POINTS, '|', 16) AS location_16
        ,SPLIT_PART( GPS_POINTS, '|', 17) AS location_17
        ,SPLIT_PART( GPS_POINTS, '|', 18) AS location_18
        ,SPLIT_PART( GPS_POINTS, '|', 19) AS location_19
        ,SPLIT_PART( GPS_POINTS, '|', 20) AS location_20
        ,SPLIT_PART( GPS_POINTS, '|', 21) AS location_21
        ,SPLIT_PART( GPS_POINTS, '|', 22) AS location_22
        ,SPLIT_PART( GPS_POINTS, '|', 23) AS location_23
        ,SPLIT_PART( GPS_POINTS, '|', 24) AS location_24
        ,SPLIT_PART( GPS_POINTS, '|', 25) AS location_25
        ,SPLIT_PART( GPS_POINTS, '|', 26) AS location_26
        ,SPLIT_PART( GPS_POINTS, '|', 27) AS location_27
        ,SPLIT_PART( GPS_POINTS, '|', 28) AS location_28
        ,SPLIT_PART( GPS_POINTS, '|', 29) AS location_29
        ,SPLIT_PART( GPS_POINTS, '|', 30) AS location_30
        ,SPLIT_PART( GPS_POINTS, '|', 31) AS location_31
        ,SPLIT_PART( GPS_POINTS, '|', 32) AS location_32
        ,SPLIT_PART( GPS_POINTS, '|', 33) AS location_33
        ,SPLIT_PART( GPS_POINTS, '|', 34) AS location_34
        ,SPLIT_PART( GPS_POINTS, '|', 35) AS location_35
        ,SPLIT_PART( GPS_POINTS, '|', 36) AS location_36
  from (
  select LISTAGG( GPS_POINT_PLANT, '|' ) WITHIN GROUP (ORDER BY PLANT_ID) AS GPS_POINTS
  from(
          select PLANT_ID,
                 CONCAT( LONGITUDE,';',LATITUDE ) as GPS_POINT_PLANT
          from   "TEAM_ART_DW"."FOLLOWMEE"."TRANSPORTATION_PLANTS"
      ) as d
  ) as e
) as f;