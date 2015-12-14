import sys
import psycopg2

#connect to the database Tcount at Postgres
conn = psycopg2.connect(dbname="Tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

#First parse the argument profile of the command line at sys.argv
a = ''.join(sys.argv[1:]).split(',')

if len(sys.argv)<=4 and len(a)==2 and a[0].isdigit and a[1].isdigit and int(a[0]) <= int(a[1]):

    cur.execute("SELECT word, count FROM tweetwordcount WHERE count >= %s AND count <= %s ORDER BY count DESC", (a[0], a[1]))
    recs = cur.fetchall()

    for rec in recs:
        print "%s: %d" % (rec[0], rec[1])
    if len(recs)==0:
        print "No such records found"
else:
    print 'Error: Format: "$python histogram.py <k1>,<k2>" where <k1> and <k2> are integers and <k1> <= <k2>'

conn.close()
