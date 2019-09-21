import csv
import os

csvpath = os.path.join('election_data.csv')

with open(csvpath, newline='') as handler:
	csvreader = csv.reader(handler, delimiter= ',')
	next(csvreader)
	candidate_name= []
	total_count = 0

	candidates= {}


	for row in csvreader:
		total_count= total_count+1
		if row[2] not in candidate_name:
			candidate_name.append(row[2])
			candidates[row[2]]=1


	print(candidate_name)
	#print(candidates)


	print(total_count)