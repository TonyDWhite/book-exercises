# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employees <- paste("Employee", (1:100))

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
salaries_2017 <- runif(100, 40000, 50000)

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.
salaries_adjustment <- runif(100, -5000, 10000)

# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(
  employees,
  salaries_2017,
  salaries_adjustment,
  stringsAsFactors = FALSE
  )

# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).
salaries$salaries_2018 <- salaries$salaries_2017 + salaries$salaries_adjustment

# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)
salaries$got_raised <- salaries_adjustment > 0


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57
salaries[57, "salaries_2018"]

# How many employees got a raise?
# watch out for boolean zen (if it's a thing here...)
nrow(salaries[salaries$got_raised, ])

# What was the dollar value of the highest raise?
max(salaries$salaries_adjustment)

# What was the "name" of the employee who received the highest raise?
salaries[salaries$salaries_adjustment == max(salaries$salaries_adjustment), "employees"]


# What was the largest decrease in salaries between the two years?
min(salaries$salaries_adjustment)

# What was the name of the employee who recieved largest decrease in salary?
salaries[salaries$salaries_adjustment == min(salaries$salaries_adjustment), "employees"]

# What was the average salary change?
mean(salaries_adjustment)

# For people who did not get a raise, how much money did they lose on average?
mean(salaries$salaries_adjustment[salaries_adjustment < 0])

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?
# yes. the average of all salary change is near the average of upper and lower bound

# Write a .csv file of your salary data to your working directory
write.csv(salaries, "salaries.csv", row.names = FALSE)
