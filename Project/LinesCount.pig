--LOAD inputfile from HDFS seperated by tab
inputFile = LOAD 'hdfs:///user/root/prathibha/Activity1' USING PigStorage('\t') AS (name:chararray,line:chararray);

--Combine all the lines for Name
grpd = GROUP inputFile BY name;

--count the occurance of each line

cntd = FOREACH grpd GENERATE group, COUNT(inputFile.line) as numLines;
result = ORDER cntd BY numLines DESC;

--Force remove projectResults folder
rmf hdfs:///user/root/prathibha/Activity1Results;

--STORE the results
STORE result INTO 'hdfs:///user/root/prathibha/Activity1Results';