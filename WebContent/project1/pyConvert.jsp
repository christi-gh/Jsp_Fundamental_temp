<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
	String url = "http://www.seoul.go.kr/coronaV/coronaStatus.do";



%>



<!-- 
import requests
from bs4 import BeautifulSoup
import csv


url = "http://www.seoul.go.kr/coronaV/coronaStatus.do"

html_content = requests.get(url).text
soup = BeautifulSoup(html_content, 'lxml')

get_table = soup.find("table", attrs={"class":"tstyleP"})

get_table_data = get_table.tbody.find_all("tr")
test = {}
data = {}
t_headers = []
table_data = []

for th in get_table.thead.find_all("th"):
    t_headers.append(th.text.replace('\n', ' ').strip())
  
t_headers = t_headers[1:]   
 
for tr in get_table.tbody.find_all("tr"): # find all tr's from table's tbody
        t_row = {}
        for th, td in zip(t_headers,tr.find_all("td")): 
            t_row[th] = td.text.replace('\n', '').strip()
        table_data.append(t_row)

data = table_data

toCSV = data
keys = toCSV[0].keys()
with open('people.csv', 'w') as output_file:
    dict_writer = csv.DictWriter(output_file, keys)
    dict_writer.writeheader()
    dict_writer.writerows(toCSV) -->