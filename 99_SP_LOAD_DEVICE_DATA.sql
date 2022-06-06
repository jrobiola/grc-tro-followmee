CREATE OR REPLACE PROCEDURE FOLLOWMEE.SP_LOAD_DEVICE_DATA()
  RETURNS string
  LANGUAGE JAVASCRIPT
  EXECUTE AS CALLER
  --CALL FOLLOWMEE.SP_LOAD_DEVICE_DATA();
AS 
$$
   var sql_cmd0  = "SELECT as_of_date::varchar(10) FROM TEAM_ART_DW.FOLLOWMEE.VW_GET_AS_OF_DATES;";
   var result    = ""
   
   try {
        var result_set0 = snowflake.execute( {sqlText: sql_cmd0} ); 
        
        while( result_set0.next() ) {
          
          var as_of_date = result_set0.getColumnValue(1);
          var sql_cmd1  = "CALL FOLLOWMEE.SP_LOAD_DEVICE_DATA_WITH_CLOSEST_PLANT('"+ as_of_date +"');";
          var result_set1 = snowflake.execute( {sqlText: sql_cmd1,binds:[as_of_date]} );
          result_set1.next();
          
          var sql_cmd2  = "CALL FOLLOWMEE.SP_LOAD_DEVICE_DATA_AGG('"+ as_of_date +"');";
          var result_set2 = snowflake.execute( {sqlText: sql_cmd2,binds:[as_of_date]} );
          result_set2.next();
		  
		  var sql_cmd3  = "CALL FOLLOWMEE.SP_LOAD_DEVICE_DATA_ANALYTICS('"+ as_of_date +"');";
          var result_set3 = snowflake.execute( {sqlText: sql_cmd3,binds:[as_of_date]} );
          result_set3.next();
        }
        
        return "success" 
    }
    catch (err)  {
        return "failed: " + err
        }
$$;
