CREATE OR REPLACE PROCEDURE FOLLOWMEE.SP_LOAD_DEVICE_DATA_ANALYTICS(P_DATE VARCHAR(10))
  RETURNS string
  LANGUAGE JAVASCRIPT
  EXECUTE AS CALLER
  --CALL FOLLOWMEE.SP_LOAD_DEVICE_DATA_AGG('2022-04-29');
AS 
$$
   var sql_cmd0  = "DELETE FROM FOLLOWMEE.DEVICE_DATA_ANALYTICS WHERE AS_OF_DATE = (:1::DATE);"
   var sql_cmd1  = "INSERT INTO FOLLOWMEE.DEVICE_DATA_ANALYTICS SELECT fn.* FROM TABLE(TEAM_ART_DW.FOLLOWMEE.FN_DEVICE_DATA_ANALYTICS(:1::DATE)) AS fn;";
   var result    = ""
   
   try {
        var result_set0 = snowflake.execute ( {sqlText: sql_cmd0,binds: [P_DATE]} ); 
        result_set0.next();
        
        var result_set1 = snowflake.execute ( {sqlText: sql_cmd1,binds: [P_DATE]} );
        result_set1.next();
        
        return "success"
        }
        
    catch (err)  {
        return "failed: " + err
        }
$$;
