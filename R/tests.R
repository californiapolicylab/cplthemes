# tests
library(tidyverse)
library(cplthemes)

setThemeCPL()

# column
mtcars %>%
    group_by(cyl) %>%
    summarize(mean_mpg = mean(mpg)) %>%
    ggplot(mapping = aes(x = cyl, y = mean_mpg)) +
    geom_col()

# column with filled cols
mtcars %>%
    mutate(cyl = factor(cyl)) %>%
    group_by(cyl) %>%
    summarize(mean_mpg = mean(mpg)) %>%
    ggplot(mapping = aes(x = cyl, y = mean_mpg, fill = cyl)) +
    geom_col() +
    labs(title = "Gas mileage by Number of Cylinders",
         subtitle = "MPG",
         x = "test",
         y = "test") +
    theme(axis.title.x.top = element_text())

# questions

# dashed and gray gridlines
# grey plot outlines
# solid grey internal y axis line
# grey text
# black note text
# horizontal y axis titles at top of axis
# legends to right or inside plot
# tan/beige color in UI plots (see Figure 16 in latest one)

