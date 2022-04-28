import mysql.connector as sql_connector

class Database: 
    def __init__(self):
        self.connection = sql_connector.connect(
            host="localhost", 
            username="root", 
            password="", 
            database="airline"
        )
        self.cursor=self.connection.cursor()


db = Database()
db.cursor.execute("SELECT * FROM USER;")

print(db.cursor.fetchall())

# print(cursor.fetchall)
