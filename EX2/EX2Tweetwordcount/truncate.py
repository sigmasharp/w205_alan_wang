import psycopg2
conn = psycopg2.connect(dbname="Tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()
print "Trucating table weetwordcount..."
cur.execute("TRUNCATE TABLE tweetwordcount");
conn.commit()
print "Done"
conn.close()
