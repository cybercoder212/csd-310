'''
    Title: pysports_join_queries.py
    Author: Yitzchok Kaplan
    Date: 29 November, 2021
    Description: Test program for joining the player and team tables.
'''

import mysql.connector
from mysql.connector import errorcode

config = {
    "user": "pysports_user",
    "password": "Mysql123!",
    "host": "localhost",
    "database": "pysports",
    "raise_on_warnings": True
}

try:
    db = mysql.connector.connect(**config)

    print("\n Database user {} connected to Mysql on host {}".format(config["user"], config["host"], config["database"]))

    input("\n\n Press any key to continue...")
except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print(" The supplied username or password are invalid")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print(" The specified database does not exist")
    else:
        print(err)

finally:
    db.close()
