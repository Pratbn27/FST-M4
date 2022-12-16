--Load the input file from HDFS
inputfile = LOAD 'hdfs:///user/prathibha/fileInput.txt' AS (lines);

-- Tokenize each wor
words = FOREACH inputfile GENERATE FLATTEN(TOKENIZE(lines)) AS word;

grpd = GROUP words BY word;

--reduce operation
count_word = FOREACH grpd GENERATE group, COUNT(words);

STORE count_word INTO 'hdfs:///user/prathibha/Output';



