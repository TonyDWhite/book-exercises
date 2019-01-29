# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")
View(flights)
# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
dep_delay_month_ave <- flights %>% 
  group_by(month) %>% 
  summarize(
    ave_delay = mean(dep_delay, na.rm = TRUE)
  )

# Which month had the greatest average departure delay?
dep_delay_month_ave %>% filter(
  ave_delay == max(ave_delay)
) %>% pull(month)

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot(dep_delay_month_ave)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
  group_by(flights, dest) %>% 
  summarize(
    ave_delay = mean(arr_delay, na.rm = TRUE )
    ) %>% 
  arrange(-ave_delay) %>% 
  head()

# You can look up these airports in the `airports` data frame!


# Which city was flown to with the highest average speed?
mutate(
  flights,
  speed = distance / air_time
) %>% #add speed
  group_by(dest) %>% 
  summarize(ave_speed = mean(speed, na.rm = TRUE)) %>% 
  filter(ave_speed == max(ave_speed, na.rm = TRUE)) %>% #why I have to remove na here too?
  pull(dest)
