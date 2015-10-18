#! /bin/bash

echo "Download raw data using wget in sildent mode, save as data.zip...."

wget 'https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip' -O data.zip -o /dev/null

echo "Unzip data.zip into a directory called 'raw'..."
unzip data.zip -d raw

echo "Change directory to raw/ to do some pre cleaning:"
cd raw

echo "Rrenaming, cutting the first line and dequted the csv file..."
echo "'Hospital General Information.csv' to hospital.csv..."
mv 'Hospital General Information.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g > hospital.csv

echo "'Readmissions and Deaths - Hospital.csv' to reAd.csv..."
mv 'Readmissions and Deaths - Hospital.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g >  reAd.csv

echo "'Readmissions and Deaths - State.csv' to reAdSt.csv..."
mv 'Readmissions and Deaths - State.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g >  reAdSt.csv

echo "'Timely and Effective Care - Hospital.csv' to timely.csv..."
mv 'Timely and Effective Care - Hospital.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g >   timely.csv

echo "'Timely and Effective Care - State.csv' to timelySt.csv..."
mv 'Timely and Effective Care - State.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g >   timelySt.csv

echo "'Complications - Hospital.csv' to comp.csv..."
mv 'Complications - Hospital.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g >  comp.csv

echo "'Complications - State.csv' to compSt.csv..."
mv 'Complications - State.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g >  compSt.csv

echo "'Healthcare Associated Infections - Hospital.csv' to hai.csv..."
mv 'Healthcare Associated Infections - Hospital.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g >  hai.csv

echo "'Healthcare Associated Infections - State.csv' to haiSt.csv..."
mv 'Healthcare Associated Infections - State.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g > haiSt.csv

echo "'Outpatient Imaging Efficiency - Hospital.csv' to img.csv..."
mv 'Outpatient Imaging Efficiency - Hospital.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g > img.csv

echo "'Outpatient Imaging Efficiency - State.csv' to imgSt.csv..."
mv 'Outpatient Imaging Efficiency - State.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g > imgSt.csv

echo "'Measure Dates.csv' to measure.csv..."
mv 'Measure Dates.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g > measure.csv

echo "'HCAHPS - Hospital.csv' to hca.csv..."
mv 'HCAHPS - Hospital.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g > hcs.csv

echo "'HCAHPS - State.csv' to hcaSt.csv..."
mv 'HCAHPS - State.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g > hcaSt.csv

echo "'hvbp_hcahps_05_28_2015.csv' to survey.csv..."
mv 'hvbp_hcahps_05_28_2015.csv' tmp.csv
tail -n +2 tmp.csv | sed -e s/\"//g > survey.csv

echo ""
echo "Now, Hadoop loading.... I am using the base AMI...."

echo "First, create the appropriate directory..."
hdfs dfs -mkdir -p /user/awang/hospital_compare

echo "Then, load the needed csv files into the hadoop directory..."
hdfs dfs -put hospital.csv reAd.csv reAdSt.csv timely.csv timelySt.csv comp.csv compSt.csv hai.csv haiSt.csv img.csv imgSt.csv measure.csv hcs.csv hcaSt.csv survey.csv /user/awang/hospital_compare
