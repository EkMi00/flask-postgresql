import csv

reader = csv.reader(open(r"crypto.csv"), delimiter=',')
# filter by currency BTC
filtered_currency = filter(lambda p: 'BTC' == p[3], reader)
# filter Jan month out from previously filtered list
filtered_month = filter(lambda p: 'Jan' == p[1], filtered_currency)
# filter 2016 year out from previously filtered list
filtered_year = filter(lambda p: '2016' == p[0], filtered_month)

# convert filter object to a list
filtered_list_of_rows = list(filtered_year)
# sort the filtered list in ascending order of days
filtered_list_of_rows.sort(key=lambda x: int(x[2]))
# create a list of list of open, high, low and close respectively to be written
rows = list()
for filtered_rows in filtered_list_of_rows:
	rows.append([filtered_rows[4], filtered_rows[5], filtered_rows[6], filtered_rows[7]])

# write output onto another csv file
writer = csv.writer(open(r"q1.csv", 'w', newline='')).writerows(rows)