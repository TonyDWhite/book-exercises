# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
#install.packages("dplyr")
library("dplyr")

# Install (if needed) and load the "fueleconomy" package
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
library("fueleconomy")

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)
vehicles_2015_Acura <- filter(
  vehicles,
  year == 2015,
  make == "Acura"
)

filter(
  vehicles_2015_Acura,
  hwy == max(hwy)
)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)
filter(
  vehicles_2015_Acura <- filter(
    vehicles,
    year == 2015,
    make == "Acura"
  ),
  hwy == max(hwy)
)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)
filter(
  vehicles,
  year == 2015,
  make == "Acura"
) %>% 
filter(
  hwy == max(hwy)
)


### Bonus

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times
# I think that might just kill my laptop
# TODO