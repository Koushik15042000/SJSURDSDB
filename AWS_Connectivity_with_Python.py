import mysql.connector
from mysql.connector import errorcode

try:
    cnx = mysql.connector.connect(user='koushik', password='koushik123',
                              host='srd-aws.cnbysbbelnea.us-west-2.rds.amazonaws.com',
                              database='sjsu_rental_database')
    cursor = cnx.cursor()
    query = ("SELECT Name, Host_ID, City, MIN(Construction_Year) AS 'Oldest Listing' FROM listings")
    cursor.execute(query)
    for (Name, Host_ID, City, Construction_Year) in cursor:
        print("{} is the oldest listing constructed in {} in {} and is listed by the Host ID {}".format(Name, Construction_Year, City, Host_ID))
    cursor.close()
    cnx.close()
except mysql.connector.Error as err:
  if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
    print("Something is wrong with your user name or password")
  elif err.errno == errorcode.ER_BAD_DB_ERROR:
    print("Database does not exist")
  else:
    print(err)
else:
  cnx.close()
