# tests
library(tidyverse)
library(cplthemes)

setThemeCPL()

# column
mtcars %>%
    group_by(cyl) %>%
    summarize(mean_mpg = mean(mpg)) %>%
    ggplot(mapping = aes(x = cyl, y = mean_mpg)) +
    geom_col() +
    scale_y_continuous(expand = expansion(mult = c(0,0.1))) +
    labs(title = "this title",
         subtitle = "subtitle")

# column with filled cols
mtcars %>%
    mutate(cyl = factor(cyl)) %>%
    group_by(cyl) %>%
    summarize(mean_mpg = mean(mpg)) %>%
    ggplot(mapping = aes(x = cyl, y = mean_mpg, fill = cyl)) +
    geom_col() +
    scale_y_continuous(expand = expand_scale(mult = c(0,0.1))) +
    labs(title = "Gas mileage by Number of Cylinders",
         subtitle = "MPG",
         x = "test",
         y = stringr::str_wrap("test with longer title to look at wrapping", width = 10),
         caption = "Source: some source about cars")

# lingering questions/design features

# inconsistency in space between columns
# inconsistency in legend placement


