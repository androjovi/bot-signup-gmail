from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import Select
from selenium.webdriver.opera.options import Options

import os
import time
import argparse
import random
import mysql.connector

config = {
  'user': 'admin',
  'password': 'WhnExp-98!',
  'host': '192.168.4.42',
  'database': 'sms_gateway',
  'raise_on_warnings': True
}

start_time = time.process_time()

parser = argparse.ArgumentParser()
parser.add_argument("firstname", help="First Name")
parser.add_argument("lastname", help="Last Name")
parser.add_argument("username", help="Username")
parser.add_argument("password", help="Password")
parser.add_argument("phone", help="Phone")
args = parser.parse_args()

firstName   = args.firstname
lastName    = args.lastname
userName    = args.username
password    = args.password
phone       = args.phone

curdir = os.getcwd()

print("Starting browser")

f = open(curdir + "/resultgmail.txt", "a")
writeto =   "username=%s,password=%s,firstname=%s,lastname=%s,phone=%s" % (userName, password, firstName, lastName,phone)
f.write(writeto)
f.close()

day = ["01","02","03",
       "04","05","06",
       "07","08","09",
       "10","11","12",
       "13","14","15",
       "16","17","18"]

year = ["1990","1991","1992"
        "1993","1994","1995",
        "1996","1997","1998",
        "1999","2000"]

def calculateTime(timedft = start_time):
    return time.process_time() - timedft

try:
    
    #cnx = mysql.connector.connect(**config)
    #cursor = cnx.cursor()
     
    # private browser
    #firefox_profile = webdriver.Chrome()
    #firefox_profile.set_preference("browser.privatebrowsing.autostart", True)
    
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument("start-maximized")
    chrome_options.add_argument("disable-infobars")
    chrome_options.add_argument("--disable-extensions")
    chrome_options.add_extension('/home/team-it/Downloads/anynomx.crx')
    #chrome_options.add_argument("--incognito")
    #chrome_options.add_argument("--headless")
    #opera_options = Options()
    #opera_options = webdriver.OperaOptions()
    #opera_options.add_argument("--start-maximized")
    
    # Set URL
    
    urlgooglesignup = "https://accounts.google.com/signup/v2/webcreateaccount?hl=en&flowName=GlifWebSignIn&flowEntry=SignUp"
    #browser = webdriver.Firefox()
    browser = webdriver.Chrome(options=chrome_options)
    #browser = webdriver.Chrome()
    #browser = webdriver.Opera()
    #browser.maximize_window()
    browser.get(urlgooglesignup)
    
    print("Open web page, duration = "+ str(calculateTime()))

    # page one
    velem = browser.find_element_by_id("firstName").send_keys(firstName)
    time.sleep(2)
    velem = browser.find_element_by_id("lastName").send_keys(lastName)
    time.sleep(2)
    velem = browser.find_element_by_id("selectioni1").click()
    time.sleep(2)

    print("Fill data page one, duration = "+ str(calculateTime()))
    
    #page two
    velem = browser.find_element_by_name("Passwd").send_keys(password)
    time.sleep(2)
    velem = browser.find_element_by_name("ConfirmPasswd").send_keys(password)
    time.sleep(2)
    
    velem = browser.find_element_by_name("Username").clear()
    time.sleep(2)
    velem = browser.find_element_by_name("Username").send_keys(userName)
    time.sleep(1)
    velem = browser.find_element_by_class_name("AjY5Oe").click()
    
    print("Fill data page two, duration = "+ str(calculateTime()))

    time.sleep(3)

    #page three
    velem = browser.find_element_by_id("phoneNumberId").send_keys(phone)
    time.sleep(2)
    velem = browser.find_element_by_class_name("DuMIQc").click()
    
    print("Fill data page three, duration = "+ str(calculateTime()))

    # verification
    time.sleep(4)
    
    print('Enter verification code, send to '+ phone)
    xcodenumber = input()
    if len(xcodenumber) < 1:
        print('Verification code is empty, exit browser')
        browser.close()
        exit()  
    
    """
    query = ("select  t1.ID 'ids', substring_index(substring_index(t1.TextDecoded,' ',1 ),'-',-1) TextDecoded   from inbox t1 left join flag_status t2 on t2.ID = t1.ID  where  t1.ID >= 18 and t2.ID is null")
    cursor.execute(query)

    result = cursor.fetchone()
    idxs = result[0]
    xcodenumber = result[1]

    cursor.execute("insert into flag_status (ID,flag) values(%s,1)",( idxs, ) )
    
    time.sleep(5)

    """
    
    velem = browser.find_element_by_id("code").send_keys(xcodenumber)
    velem = browser.find_element_by_class_name("qIypjc").click()
    
    """
    cnx.commit()
    cursor.close()
    cnx.close()
    """
    
    print("Fill verification code, duration = "+ str(calculateTime()))

    time.sleep(2)

    velem = Select(browser.find_element_by_id('month')).select_by_visible_text('January')
    time.sleep(2)
    randday = random.randint(0 ,17)
    time.sleep(1)
    randday = day[randday]
    time.sleep(2)
    velem = browser.find_element_by_id("day").send_keys(randday)
    time.sleep(2)
    randyear = random.randint(0 ,10)
    time.sleep(1)
    randyear = year[randyear]
    time.sleep(2)
    velem = browser.find_element_by_id("year").send_keys(randyear)
    time.sleep(2)
    velem = browser.find_element_by_name("recoveryEmail").send_keys("wahanapl88@gmail.com")
    time.sleep(1)
    velem = Select(browser.find_element_by_id('gender')).select_by_value('3')
    time.sleep(2)
    velem = browser.find_element_by_class_name("DuMIQc").click()
    
    print("Fill data birthday, duration = "+ str(calculateTime()))

    time.sleep(5)
    velem = browser.find_element_by_class_name("DuMIQc").click()
    
    print("Click rules, duration = "+ str(calculateTime()))

    time.sleep(2)
    browser.execute_script("window.scrollTo(0, document.body.scrollHeight);")
    time.sleep(1)
    velem = browser.find_element_by_id("termsofserviceNext").click()
    
    print("Click Term of Service, duration = "+ str(calculateTime()))
    
    print('Registration almost done')
    
    time.sleep(5)
    
    # write log to file
    took_time = time.process_time() - start_time
    f = open(curdir + "/resultgmail.txt", "a")
    writeto =   ",fail=%s,error=,took=%s|\n" % ("0",took_time)
    f.write(writeto)
except Exception as e:
    print("Error" + str(e))
    took_time = time.process_time() - start_time
    f = open(curdir + "/resultgmail.txt", "a")
    writeto =   ",fail=1,error=%s,took=%s|\n" % (str(e),took_time)
    f.write(writeto)

print("Continue browser manually, took="+ str(time.process_time() - start_time))
time.sleep(1)
##browser.close()