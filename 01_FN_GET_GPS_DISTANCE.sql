CREATE OR REPLACE FUNCTION TEAM_ART_DW.FOLLOWMEE.FN_GET_GPS_distance(P_LAT1 FLOAT,P_LAT2 FLOAT,P_LON1 FLOAT, P_LON2 FLOAT)
RETURNS FLOAT
LANGUAGE JAVASCRIPT
AS
$$
  var result = 0;
  
  var lon1 = P_LON1 * Math.PI / 180;
  var lon2 = P_LON2 * Math.PI / 180;
  var lat1 = P_LAT1 * Math.PI / 180;
  var lat2 = P_LAT2 * Math.PI / 180;
  
  // Haversine formula
  var dlon = lon2 - lon1;
  var dlat = lat2 - lat1;
  var a = Math.pow(Math.sin(dlat / 2), 2)
                 + Math.cos(lat1) * Math.cos(lat2)
                 * Math.pow(Math.sin(dlon / 2),2);
                 
  var c = 2 * Math.asin(Math.sqrt(a));
  
  // Radius of earth in miles
  var r = 3956;
  
  // Final distance 
  result = c * r;
  return result;
$$;
