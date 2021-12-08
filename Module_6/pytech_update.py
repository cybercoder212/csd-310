""" 
    Title: pytech_update.py
    Author: Yitzchok Kaplan
    Date: November 29, 2021
    Description: Updating documents in the students collection 
"""

# Imports MongoClient from pymongo
""" import statements """
from pymongo import MongoClient

# MongoDB connection string 
url = "mongodb+srv://admin:admin@cluster0.qqcdb.mongodb.net/cluster0.qqcdb.mongodb.net?retryWrites=true&w=majority"

# connect to the MongoDB cluster and bypass tls/ssl
client = MongoClient(url, tls=True, tlsAllowInvalidCertificates=True)

# connect pytech database
db = client['pytech']

# get the students collection
students = db.students

# find all students in the collection 
student_list = students.find({})

# display message 
print("\n  -- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")

# loop over the collection and output the results 
for doc in student_list:
    print("  Student ID: " + doc["student_id"] + "\n  First Name: " + doc["first_name"] + "\n  Last Name: " + doc["last_name"] + "\n")

# updates student 1007 last name
result = students.update_one({"student_id": "1007"}, {"$set": {"last_name": "Ford"}})

# find the updated student document 
fred = students.find_one({"student_id": "1007"})

# display message
print("\n  -- DISPLAYING STUDENT DOCUMENT 1007 --")

# output the updated document to the terminal window
print("  Student ID: " + fred["student_id"] + "\n  First Name: " + fred["first_name"] + "\n  Last Name: " + fred["last_name"] + "\n")
