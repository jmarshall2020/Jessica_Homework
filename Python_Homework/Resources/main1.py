import os
import csv
import pandas as pd

csvpath ='budget_data.csv'


with open (csvpath, newline='') as handler:
	csvreader = csv.reader(handler, delimiter=",")
	next(csvreader)
	total_months =[]
	#total_net = []

	head = next(csvreader)

	first_row = next(csvreader)
	total_months = total_months + 1
	# total_net = total_net + int(first_row[1])
	# prev_net = int(first_row[1])


	for row in csvreader:

		total_months = total_months + 1
	# 	total_net = total_net + int(row[1])
	# 	net_change = int(row[1]) - prev_net
	# 	prev_net = int(row[1])
	# 	net_change_list = net_change_list + [net_change]
	# 	month_of_change = month_of_change +[row[0]]





print(total_months)
print(total_net)
