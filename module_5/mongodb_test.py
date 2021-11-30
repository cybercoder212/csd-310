""" 
    Title: mongodb_test.py
    Author: Yitzchok Kaplan
    Date: 28 November 2021
    Description: Test program for connecting to a 
                 MongoDB Atlas cluster
"""

""" import statements """
from pymongo import MongoClient

# MongoDB connection string 
url = "mongodb+srv://admin:admin@cluster0.qqcdb.mongodb.net/cluster0.qqcdb.mongodb.net?retryWrites=true&w=majority"

# connect to the MongoDB cluster and bypass tls/ssl
client = MongoClient(url, tls=True, tlsAllowInvalidCertificates=True)

# connect pytech database
db = client['pytech']

# show the connected collections 
print(db.list_collection_names())

# show an exit message
input("\n\n  End of program, press any key to exit... ")
