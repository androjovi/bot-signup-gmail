from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
from pprint import pprint

import time
import random
import mysql.connector


config = {
  'user': 'admin',
  'password': 'WhnExp-98!',
  'host': '192.168.4.42',
  'database': 'sms_gateway',
  'raise_on_warnings': True
}

cnx = mysql.connector.connect(**config)
cursor = cnx.cursor()

query = ("select  t1.ID 'ids', substring_index(substring_index(t1.TextDecoded,' ',1 ),'-',-1) TextDecoded   from inbox t1 left join flag_status t2 on t2.ID = t1.ID  where  t1.ID >= 18 and t2.ID is null")
cursor.execute(query)

result = cursor.fetchone()
idxs = result[0]
text = result[1]

cursor.execute("insert into flag_status (ID,flag) values(%s,1)",( idxs, ) )

cnx.commit()
cursor.close()
cnx.close()