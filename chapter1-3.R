library(nycflights13)
library(tidyverse)

glimpse(flights)

# brief introduction to pipe and dplyr basic functions
#   - dplyr verbs (eg. filter, group_by ) are desighed take a dataframe as the first argument
#   - pipe takes the return value of expersion on its left side
#     and passes it as the first argument to the function on its right
flights |>
  filter(dest == "IAH") |>
  group_by(year, month, day) |>
  summarise(
    arr_delay = mean(arr_delay, na.rm = TRUE)
  )


# row manipulations
flights |>
  filter(month %in% c(1, 2))

flights |>
  arrange(dep_time, year, month, day, desc(dep_delay))

flights |>
  distinct(origin, dest)

flights |>
  distinct(origin, dest, .keep_all = TRUE)

flights |>
  count(origin, dest, sort = TRUE)

# column manipulations
flights |>
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60,
    # .before = 1
    .after = day
  )

flights |>
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / air_time * 60,
    .keep = "used"
  )

flights |>
  select(year, month, day)

flights |>
  select(year:day)

flights |>
  select(!year:day)

flights |>
  select(where(is.character))


# pipe
flights |>
  filter(dest == "IAH") |>
  mutate(speed = distance / air_time * 60) |>
  select(year:day, dep_time, carrier, flight, speed) |>
  arrange(desc(speed))

# groups
flights |>
  group_by(month)

flights |>
  group_by(month) |>
  summarize(
    avg_delay = mean(dep_delay, na.rm = TRUE)
  )

flights |>
  group_by(month) |>
  summarize(
    avg_delay = mean(dep_delay, na.rm = TRUE),
    n = n()
  )
