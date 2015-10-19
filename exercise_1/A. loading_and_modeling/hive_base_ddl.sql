DROP TABLE hospital;
DROP TABLE measure;
DROP TABLE reAd;
DROP TABLE survey;
DROP TABLE timely;

CREATE EXTERNAL TABLE hospital (
Provider_ID VARCHAR(8),
Hospital_Name VARCHAR(52),
Address VARCHAR(52),
City VARCHAR(22),
State VARCHAR(4),
ZIP_Code VARCHAR(7),
County_Name VARCHAR(22),
Phone_Number VARCHAR(12),
Hospital_Type VARCHAR(38),
Hospital_Ownership VARCHAR(45),
Emergency_Services VARCHAR(5)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/awang/hospital_compare/hospital';

CREATE EXTERNAL TABLE measure (
Measure_Name VARCHAR(159),
Measure_ID VARCHAR(20),
Measure_Start_Quarter VARCHAR(8),
Measure_Start_Date VARCHAR(21),
Measure_End_Quarter VARCHAR(8),
Measure_End_Date VARCHAR(21)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/awang/hospital_compare/measure';

CREATE EXTERNAL TABLE reAd (
Provider_ID VARCHAR(8),
Hospital_Name VARCHAR(52),
Address VARCHAR(45),
City VARCHAR(21),
State VARCHAR(4),
ZIP_Code VARCHAR(7),
County_Name VARCHAR(22),
Phone_Number VARCHAR(12),
Measure_Name VARCHAR(89),
Measure_ID VARCHAR(20),
Compared_to_National VARCHAR(37),
Denominator VARCHAR(15),
Score FLOAT,
Lower_Estimate VARCHAR(15),
Higher_Estimate VARCHAR(15),
Footnote VARCHAR(58),
Measure_Start_Date VARCHAR(12),
Measure_End_Date VARCHAR(12)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/awang/hospital_compare/reAd';

CREATE EXTERNAL TABLE survey (
Provider_Number VARCHAR(8),
Hospital_Name VARCHAR(52),
Address VARCHAR(46),
City VARCHAR(22),
State VARCHAR(4),
ZIP_Code VARCHAR(12),
County_Name VARCHAR(22),
Nurses_Achievement_n float,
Nurses_Improvement_n float,
Nurses_Dimension_n float,
Doctors_Achievement_n float,
Doctors_Improvement_n float,
Doctors_Dimension_n float,
Staff_Achievement_n float,
Staff_Improvement_n float,
Staff_Dimension_n float,
Pain_Achievement_n float,
Pain_Improvement_n float,
Pain_Dimension_n float,
Medicines_Achievement_n float,
Medicines_Improvement_n float,
Medicines_Dimension_n float,
Environment_Achievement_n float,
Environment_Improvement_n float,
Environment_Dimension_n float,
Discharge_Achievement_n float,
Discharge_Improvement_n float,
Discharge_Dimension_n float,
Overall_Achievement_n float,
Overall_Improvement_n float,
Overall_Dimension_n float,
HCAHPS_Base_Score int,
HCAHPS_Consistency_Score int
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/awang/hospital_compare/survey';

CREATE EXTERNAL TABLE timely (
Provider_ID VARCHAR(8),
Hospital_Name VARCHAR(52),
Address_ VARCHAR(46),
City VARCHAR(22),
State VARCHAR(4),
ZIP_Code VARCHAR(7),
County_Name VARCHAR(22),
Phone_Number VARCHAR(12),
Condition VARCHAR(37),
Measure_ID VARCHAR(18),
Measure_Name VARCHAR(137),
Score FLOAT,
Sample VARCHAR(15),
Footnote VARCHAR(181),
Measure_Start_Date VARCHAR(12),
Measure_End_Date VARCHAR(12)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/awang/hospital_compare/timely';
