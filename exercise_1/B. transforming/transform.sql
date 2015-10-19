DROP TABLE hosp;
DROP TABLE meas;
DROP TABLE qual;


CREATE EXTERNAL TABLE hosp (
hid VARCHAR(8),
hnm VARCHAR(52),
stt VARCHAR(4)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/awang/hospital_compare/hosp';

FROM hospital INSERT OVERWRITE TABLE hosp SELECT Provider_ID, Hospital_Name, State;

CREATE EXTERNAL TABLE meas (
mid VARCHAR(20),
sqt VARCHAR(8),
eqt VARCHAR(8),
typ VARCHAR(2)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/awang/hospital_compare/meas';

FROM measure INSERT OVERWRITE TABLE meas SELECT Measure_ID, Measure_Start_Quarter, Measure_Start_Quarter, SUBSTR(Measure_ID, 0, 2);



CREATE EXTERNAL TABLE qual (
mid VARCHAR(20),
hid VARCHAR(8),
qul VARCHAR(45)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/awang/hospital_compare/qual';

create table tmp(
av double,
st double)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

FROM reAd INSERT OVERWRITE TABLE tmp SELECT avg(Score), stddev_samp(Score);
FROM reAd, tmp INSERT OVERWRITE TABLE qual SELECT Measure_ID, Provider_ID, (Score-av)/st;

FROM timely INSERT OVERWRITE TABLE tmp SELECT avg(Score), stddev_samp(Score);
FROM timely, tmp INSERT OVERWRITE TABLE qual SELECT Measure_ID, Provider_ID, (Score-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Nurses_Achievement_n), stddev_samp(Nurses_Achievement_n);
FROM survey INSERT INTO TABLE qual SELECT "NurAch", Provider_Number, (Nurses_Achievement_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Nurses_Improvement_n), stddev_samp(Nurses_Improvement_n);
FROM survey INSERT INTO TABLE qual SELECT "NurImp", Provider_Number, (Nurses_Improvement_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Nurses_Dimension_n), stddev_samp(Nurses_Dimension_n);
FROM survey INSERT INTO TABLE qual SELECT "NurDim", Provider_Number, (Nurses_Dimension_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Staff_Achievement_n), stddev_samp(Staff_Achievement_n);
FROM survey INSERT INTO TABLE qual SELECT "DocAch", Provider_Number, (Staff_Achievement_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Staff_Improvement_n), stddev_samp(Staff_Improvement_n);
FROM survey INSERT INTO TABLE qual SELECT "DocImp", Provider_Number, (Staff_Improvement_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Staff_Dimension_n), stddev_samp(Staff_Dimension_n);
FROM survey INSERT INTO TABLE qual SELECT "DocDim", Provider_Number, (Staff_Dimension_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Pain_Achievement_n), stddev_samp(Pain_Achievement_n);
FROM survey INSERT INTO TABLE qual SELECT "PanAch", Provider_Number, (Pain_Achievement_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Pain_Improvement_n), stddev_samp(Pain_Improvement_n);
FROM survey INSERT INTO TABLE qual SELECT "PanImp", Provider_Number, (Pain_Improvement_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Pain_Dimension_n), stddev_samp(Pain_Dimension_n);
FROM survey INSERT INTO TABLE qual SELECT "PanDim", Provider_Number, (Pain_Dimension_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Medicines_Achievement_n), stddev_samp(Medicines_Achievement_n);
FROM survey INSERT INTO TABLE qual SELECT "MedAch", Provider_Number, (Medicines_Achievement_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Medicines_Improvement_n), stddev_samp(Medicines_Improvement_n);
FROM survey INSERT INTO TABLE qual SELECT "MedImp", Provider_Number, (Medicines_Improvement_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Medicines_Dimension_n), stddev_samp(Medicines_Dimension_n);
FROM survey INSERT INTO TABLE qual SELECT "MedDim", Provider_Number, (Medicines_Dimension_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Environment_Achievement_n), stddev_samp(Environment_Achievement_n);
FROM survey INSERT INTO TABLE qual SELECT "EnvAch", Provider_Number, (Environment_Achievement_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Environment_Improvement_n), stddev_samp(Environment_Improvement_n);
FROM survey INSERT INTO TABLE qual SELECT "EnvImp", Provider_Number, (Environment_Improvement_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Environment_Dimension_n), stddev_samp(Environment_Dimension_n);
FROM survey INSERT INTO TABLE qual SELECT "EnvDim", Provider_Number, (Environment_Dimension_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Discharge_Achievement_n), stddev_samp(Discharge_Achievement_n);
FROM survey INSERT INTO TABLE qual SELECT "DisAch", Provider_Number, (Discharge_Achievement_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Discharge_Improvement_n), stddev_samp(Discharge_Improvement_n);
FROM survey INSERT INTO TABLE qual SELECT "DisImp", Provider_Number, (Discharge_Improvement_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Discharge_Dimension_n), stddev_samp(Discharge_Dimension_n);
FROM survey INSERT INTO TABLE qual SELECT "DisDim", Provider_Number, (Discharge_Dimension_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Overall_Achievement_n), stddev_samp(Overall_Achievement_n);
FROM survey INSERT INTO TABLE qual SELECT "OvlAch", Provider_Number, (Overall_Achievement_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Overall_Improvement_n), stddev_samp(Overall_Improvement_n);
FROM survey INSERT INTO TABLE qual SELECT "OvlImp", Provider_Number, (Overall_Improvement_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(Overall_Dimension_n), stddev_samp(Overall_Dimension_n);
FROM survey INSERT INTO TABLE qual SELECT "OvlDim", Provider_Number, (Overall_Dimension_n-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(HCAHPS_Base_Score), stddev_samp(HCAHPS_Base_Score);
FROM survey INSERT INTO TABLE qual SELECT "BaseSc", Provider_Number, (HCAHPS_Base_Score-av)/st;

FROM survey INSERT OVERWRITE TABLE tmp SELECT avg(HCAHPS_Consistency_Score), stddev_samp(HCAHPS_Consistency_Score);
FROM survey INSERT INTO TABLE qual SELECT "Consis", Provider_Number, (HCAHPS_Consistency_Score-av)/st;

