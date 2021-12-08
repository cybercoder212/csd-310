""" 
    Title: pytech_insert.py
    Author: Yitzchok Kaplan
    Date: November 29, 2021
    Description: Test program for inserting new documents 
                 into the students collection 
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

""" three student documents"""
# Fred Smith data document 
fred = {
    "student_id": "1007",
    "first_name": "Fred",
    "last_name": "Smith",
    "enrollments": [
        {
            "term": "Session 1",
            "gpa": "4.0",
            "start_date": "November 2, 2020",
            "end_date": "January 4, 2021",
            "courses": [
                {
                    "course_id": "CSD310",
                    "description": "Database Development",
                    "instructor": "Professor Greyson",
                    "grade": "A+"
                },
                {
                    "course_id": "CSD320",
                    "description": "Coding with Java",
                    "instructor": "Professor Greyson",
                    "grade": "A+"
                }
            ]
        }
    ]

}

# Bruce Bennett data document 
bruce = {
    "student_id": "1008",
    "first_name": "Bruce",
    "last_name": "Bennett",
    "enrollments": [
        {
            "term": "Session 1",
            "gpa": "4.0",
            "start_date": "November 2, 2020",
            "end_date": "January 4, 2021",
            "courses": [
                {
                    "course_id": "CSD310",
                    "description": "Database Development",
                    "instructor": "Professor Greyson",
                    "grade": "A+"
                },
                {
                    "course_id": "CSD320",
                    "description": "Coding with Java",
                    "instructor": "Professor Greyson",
                    "grade": "A+"
                }
            ]
        }
    ]
}

# Hal Harrison data document
hal = {
    "student_id": "1009",
    "first_name": "Hal",
    "last_name": "Harrison",
    "enrollments": [
        {
            "term": "Session 1",
            "gpa": "4.0",
            "start_date": "November 2, 2020",
            "end_date": "January 4, 2021",
            "courses": [
                {
                    "course_id": "CSD310",
                    "description": "Database Development",
                    "instructor": "Professor Greyson",
                    "grade": "A+"
                },
                {
                    "course_id": "CSD320",
                    "description": "Coding with Java",
                    "instructor": "Professor Greyson",
                    "grade": "A+"
                }
            ]
        }
    ]
}

# get the students collection 
students = db.students

# insert statements with output 
print("\n  -- INSERT STATEMENTS --")
fred_student_id = students.insert_one(fred).inserted_id
print("  Inserted student record Fred Smith into the students collection with document_id " + str(fred_student_id))

bruce_student_id = students.insert_one(bruce).inserted_id
print("  Inserted student record Bruce Bennett into the students collection with document_id " + str(bruce_student_id))

hal_student_id = students.insert_one(hal).inserted_id
print("  Inserted student record Hal Harrison into the students collection with document_id " + str(hal_student_id))

input("\n\n  End of program, press any key to exit... ")
