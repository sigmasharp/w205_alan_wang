from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2
conn = psycopg2.connect(dbname="Tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
        cur = conn.cursor()

    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount 
        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.

        # There should be a more elegant way to merge the following SQL into
        # one statement, but POSTGRES document stated that requires newest version.
        # To make sure the code would run more 'universally', I am going to use a 
        # more combursome method as follows:

        # First try to select the current count

        cur.execute("SELECT count FROM tweetwordcount WHERE word = %s", (word,))
        recs = cur.fetchall()
        
        #if none found, we need to insert one row for the word, with count initialized to 1
        if len(recs) == 0:
            cur.execute("INSERT INTO tweetwordcount (word,count) VALUES (%s, 1)", (word,));
        #otherwise, we need to update the count by adding 1 to it
        else:
            plus1 = int(recs[0][0]) + 1
            cur.execute("UPDATE tweetwordcount set count=%s WHERE word=%s", (str(plus1), word));
        conn.commit()

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
