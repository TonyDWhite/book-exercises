# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")
View(flights)
# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
ave_arr_delay_dest <- group_by(flights, dest) %>% 
  summarize(ave_arr_delay = mean(arr_delay, na.rm = TRUE))

airports <- left_join(airports, ave_arr_delay_dest, by = c("faa" = "dest"))#watch that it's = here!

airports %>% 
filter(ave_arr_delay == max(ave_arr_delay, na.rm = TRUE)) %>%  
  pull(name)
# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
airlines <- group_by(flights, carrier) %>% 
  summarize(ave_delay_airline = mean(arr_delay, na.rm = TRUE)) %>% 
  right_join(airlines, by = "carrier") # used right join so don't need another variable, but the row order is wrong
#OR
ave_carrier_delay <- group_by(flights, carrier) %>% 
  summarize(ave_delay_airline = mean(arr_delay, na.rm = TRUE))
airlines <- left_join(airlines, ave_carrier_delay, by = "carrier")
