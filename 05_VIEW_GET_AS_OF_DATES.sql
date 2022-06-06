CREATE OR REPLACE VIEW TEAM_ART_DW.FOLLOWMEE.VW_GET_AS_OF_DATES AS
SELECT as_of_date 
FROM (
  select current_date as as_of_date  
  union 
  select dateadd( 'd', -1, current_date ) as as_of_date
  union 
  select dateadd( 'd', -2, current_date ) as as_of_date
  union 
  select dateadd( 'd', -3, current_date ) as as_of_date
  union 
  select dateadd( 'd', -4, current_date ) as as_of_date
  union 
  select dateadd( 'd', -5, current_date ) as as_of_date
  union 
  select dateadd( 'd', -6, current_date ) as as_of_date
  union 
  select dateadd( 'd', -7, current_date ) as as_of_date
) s1
order by 1;
