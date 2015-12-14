import sys
import psycopg2

#connect to the database Tcount at Postgres
conn = psycopg2.connect(dbname="Tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

cur.execute("SELECT word, count FROM tweetwordcount ORDER BY count desc LIMIT 20")
recs = cur.fetchall()
for rec in recs:
    print "%s,%d" % (rec[0], rec[1])
