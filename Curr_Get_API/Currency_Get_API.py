


import pyodbc
import urllib.request
import json

conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=TM-PC;'
                      'Database=AdventureWorksSTG;'
                      'Trusted_Connection=yes;')
cursor = conn.cursor()

data = urllib.request.urlopen(
    "https://api.exchangeratesapi.io/history?start_at=2008-01-01&end_at=2021-01-01&symbols=USD,NZD").read()
output = json.loads(data)

for v in output["rates"]:
    for y in output["rates"][v]:
        cursor.execute("INSERT INTO Currencies(Datev1,CurType,Rate) VALUES (?,?,?)", (v, y, str(output["rates"][v][y])))

cursor.commit()       
