select hid, sum(qul) as a, sum(HCAHPS_Base_Score), sum(HCAHPS_Consistency_Score) from survey, qual 
where hid = Provider_Number group by hid order by a desc limit 50;