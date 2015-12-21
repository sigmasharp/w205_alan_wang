*** All storm application AND the three utilities are stored under the same directory as instructed at EX2Tweetwordcount.
   I will refer this directory as the 'base' directory.  This might be the closest to 'turn-key' installation.
*** Assuming python, sparse, and Postgres are all installed as the document has indicated.

Step 1: make sure the database Tcount is properly created and the table tweetwordcount is defined.
   Since the Psycog2 connect function turns out does NOT automatically create new databases, we need to initialize
   and create the Tcount database.
   a. I created a sub-directory under the base.  It is named 'db-init'.  Please cd to that directory.
   b. If there was no previous database existing as Tcount, then please do $./createdb.sh
   c. If there is already a previous database Tcount, then please do $./dropdb.sh to delete it first, then do 1.b
   d. Either way, afterwards, please perform $python createtable.py to create the database.

Step 2: once we are sure the Tccount database is properly initialized, we can move on to storm
   At the Ex2Tweetwordcount directory, you should be able to run $sparse run directly. and you should see the outcome
   rolling out after the second time the "Enter" key is hit.

Step 3: You can let Step-2 running for a while, preferably from a different putty, you should be able to check out the following utilities developed
as instructed.

    a. finalresults.py:  this can be performed with one argument or without arguments.  You should see the former will yield
	   one line telling you the word count for the specified word (including 0).  In the non-argument version, all words
	   in the database will be displayed, which could be annoying if after a long execution of the system.
    b. histogram.py: This was developed with a board range of tolerance of input conventions.  Basically it will take
	   all argument which can be resolved to <k1>,<k2> where k1 and k2 are integers and k1 <= k2. (You can insert blan around ',')
    c. If interested, you can also run python top20.py to get the top 20 wordc ounts .