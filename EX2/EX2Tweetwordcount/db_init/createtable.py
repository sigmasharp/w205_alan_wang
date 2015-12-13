import psycopg2

#Connecting to a database
#The first step is to create a cursor. 

conn = psycopg2.connect(dbname="Tcount", user="postgres", password="pass", host="localhost", port="5432")

#Create a Table
cur = conn.cursor()
cur.execute('''CREATE TABLE tweetwordcount
       (word TEXT PRIMARY KEY     NOT NULL,
       count INT     NOT NULL);''')
conn.commit()
conn.close()
