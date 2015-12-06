#MASTER=local[2] pyspark
from pyspark import SparkContext
from pyspark.streaming import StreamingContext
import json
ssc = StreamingContext(sc, 5)
lines=ssc.textFileStream("file:///tmp/datastreams").flatMap(lambda x: [ j['venue'] for j in json.loads('['+x+']') if 'venue' in j] ).saveAsTextFiles('file:///tmp/output/outs')
#the file is saved as a textfile in potentially parts as
#/tmp/output/outs-1449421755000/part-00000 and so on
ssc.start()

