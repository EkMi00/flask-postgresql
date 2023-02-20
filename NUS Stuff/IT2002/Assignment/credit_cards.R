# Q7 Find the last and first names of the different 
# Singaporean customers. Print the result in alphabetical order of the last and first names.

# Q8 For each Singaporean customer, find his or her 
# first and last name and total expenditure. Implicitly 
# ignore customers who did not use their credit cards or do not have a credit card.

# Q9 Find the social security number of the different customers who 
# purchased something on Christmas day 2017 with their Visa 
# card (the credit card type is "Visa")

# Q10 For each customer and for each credit card type, find how many
# credit cards of that type the customer owns. Print the customer's 
# social security number, the credit card type and the number of 
# credit cards of the given type owned. Print zero if a customer does
# not own a credit card of the given type.

# Q11 Find the code and name of different merchants who did
# not entertain transactions for every type of credit card.
# Do not use aggregate functions.
setwd("/mnt/c/Users/Keck/Documents/GitHub/Flask-PostgreSQL/NUS Stuff/IT2002/Assignment")
table1 <- read.csv("Thailand_not_JCB.csv", header =TRUE,sep= ",")
table2 <- read.csv("Thailand_not_JCB2.csv", header =TRUE,sep= ",")
table3 <- read.csv("Thailand_not_JCB3.csv", header =TRUE,sep= ",")
table4 <- read.csv("Thailand_not_JCB4.csv", header =TRUE,sep= ",")
table5 <- read.csv("Thailand_not_JCB5.csv", header =TRUE,sep= ",")

print(identical(table1, table2))
print(identical(table1, table3))
print(identical(table1, table4))
print(identical(table1, table5))


# Q12 Find the first and last names of the different customers
# from Thailand who do not have a JCB credit card (the credit
# card type is "jcb"). Propose five (5) different SQL queries