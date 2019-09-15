import os
import csv
import pandas as pd


csvpath ='../Resources/budget_data.csv'



total_months = 0
total_net = 0
sum_of_list = 0
month_of_change = []
net_change_list = []
greatest_increase = ["", 0]
greatest_decrease = ["", 9999999999999999999]

with open (csvpath, newline='') as handler:
	csvreader = csv.reader(handler, delimiter=",")

	head = next(csvreader)

	first_row = next(reader)
   	total_months = total_months + 1
   	total_net = total_net + int(first_row[1])
   	prev_net = int(first_row[1])


  

	for row in csvreader:
       # Track the total
       total_months = total_months + 1
       total_net = total_net + int(row[1])
       # Track the net change
       net_change = int(row[1]) - prev_net
       prev_net = int(row[1])
       net_change_list = net_change_list + [net_change]
       month_of_change = month_of_change + [row[0]]



       #calculating greatest increase/decrease
       if net_change > greatest_increase[1]:
           greatest_increase[0] = row[0]
           greatest_increase[1] = net_change
       # Calculate the greatest decrease
       if net_change < greatest_decrease[1]:
           greatest_decrease[0] = row[0]
           greatest_decrease[1] = net_change

	net_monthly_avg = sum(net_change_list) / len(net_change_list)



print(total_months)
print(sum_of_list)
print(total_net)
print(net_monthly_avg)
print(greatest_increase[0],greatest_increase[1])
print(greatest_decrease[0],greatest_decrease[1])











