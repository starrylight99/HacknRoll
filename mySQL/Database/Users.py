import mysql.connector


def connect():
    mydb = mysql.connector.connect(
      host="localhost",
      user="root",
      password="MyNewPass",
      database="mydatabase"
    )
    return mydb


def run(string):
    mydb = connect()

    details = string.rsplit(' ', 1)
    print(details)
    
    mycursor = mydb.cursor(named_tuple=True)

    # Check if user entered correct credentials
    login = details[0]
    password = details[1]
    mycursor.execute(f"SELECT login, password FROM users WHERE login='{login}' AND password='{password}'")
    check = mycursor.fetchone()
    if check is None:
        # deny login
        # print("Wrong Username/Password!")
        return False
    else:
        # successful login
        # print("Login successful!")
        return True


def new(string):
    mydb = connect()

    details = string.rsplit(' ', 1)
    print(details)

    mycursor = mydb.cursor(named_tuple=True)

    new_login = details[0]
    new_password = details[1]

    mycursor.execute(f"SELECT login FROM users WHERE login='{new_login}'")
    test = mycursor.fetchall()
    print(test)
    if not test:
        sql = "INSERT INTO users (login, password) VALUES (%s, %s)"
        val = (new_login, new_password)
        mycursor.execute(sql, val)
        mydb.commit()
        print(mycursor.rowcount, "record inserted.")
        print("1 record inserted, ID:", mycursor.lastrowid)
        return True
    else:
        return False

    # mycursor.execute("CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, login VARCHAR(255),
    # password VARCHAR(255))")

    # mycursor.execute("SHOW TABLES")
    # for x in mycursor:
    # print(x)

    # mycursor.execute("ALTER TABLE users ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY")

    '''
# Change password
login = # finds user's account login
new_password = # take new password
mycursor.execute(f"UPDATE users SET password = '{password}' WHERE login = '{login}'")
mydb.commit()
print(mycursor.rowcount, "record(s) affected")

# Delete account
login = # finds user's account login

mycursor.execute(f"DELETE FROM users WHERE login = '{login}'")
mydb.commit()
print(mycursor.rowcount, "record(s) deleted")
'''
