import sys
import psycopg2

#connect to the database Tcount at Postgres
conn = psycopg2.connect(dbname="Tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

#First check the argument profile of the command line at sys.argv
if len(sys.argv) == 2: # exactly one argument.  Note: the command 'finalresults.py' counts as 1
    word = sys.argv[1]  # get the word in
    wordCount = 0       # initialzie the count to 0

    #exeute the query to search for the word in the database
    cur.execute("SELECT count FROM tweetwordcount WHERE word = %s", (word,))
    recs = cur.fetchall()
 
    if len(recs) == 1:
       wordCount = recs[0][0]

    print "Toal number of occurences of \"%s\": %d" % (word, wordCount)

elif len(sys.argv) == 1: #without any argument
    cur.execute("SELECT word, count FROM tweetwordcount ORDER BY word")
    recs = cur.fetchall()

    for rec in recs:
        print "(%s, %d)\n" % (rec[0], rec[1])

    if len(recs)==0:
        print "No word count records found"
else:
    print 'Error: too many arguments.  Format: "$python finalresults.py", or "$python finalresults.py <word>"'

conn.close()
