# pylint: disable=invalid-name

import sys
import csv
from re import sub
from decimal import Decimal

data = {}
dataFile = sys.argv[1]
lookFor = sys.argv[2]

with open(dataFile) as csvFile:
  # read the file as a dictionary for each row ({key : amount})
    reader = csv.DictReader(csvFile)
    for row in reader:
        money = row['amount'].strip()
        amount = Decimal(sub(r'[^\d.]', '', money))
        if row['from'] in data:
            data[row['from']] += amount
        else:
            data[row['from']] = amount

def showResult(number):
    ''' Shows result of supplied Number '''
    for key, value in data.items():
        # print(key, value, number)
        if key == str(number):
            print(key, value, number)
    return

showResult(lookFor)
