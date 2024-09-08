import sqlite3
from sqlite3 import Error


class Db:
    def __init__(self):
        self.conn = None

    def create_connection(self, db_file):
        try:
            self.conn = sqlite3.connect(db_file)
            self.conn.execute('DELETE FROM Texts')      
            self.conn.execute('CREATE TABLE IF NOT EXISTS Texts (id INTEGER PRIMARY KEY, body TEXT)')
            self.conn.commit()
        except Error as e:
            print(e)
        finally:
            if self.conn:
                self.conn.close()

    def open_connection(self, db_file):
        try:
            self.conn = sqlite3.connect(db_file)
            return True
        except Error as e:
            print(e)
        return False

    def close_connection(self):
        try:
            self.conn.close()
        except Error as e:
            print(e)

    def insert_record(self, word, frequency, blob, transcript):
        try:
            # self.conn.execute('INSERT INTO Texts(body) values(?)', (text,))
            self.conn.execute('INSERT INTO dictionary VALUES(?,?,?,?)', (word, frequency, blob, transcript))
            self.conn.commit()
        except Error as e:
            print(e)
        pass