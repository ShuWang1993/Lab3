## Problem 2:
library(gapminder)
library(tidyverse)

gapminder
data_2007 <- filter(gapminder, year == 2007)

p1 <- ggplot(data=data_2007, aes(x=gdpPercap, y=lifeExp)) +
  geom_point(size=1)

data_gdp <- filter(data_2007, gdpPercap > 40000, continent == "Europe")
p1 <- p1 + 
  geom_text(data=data_gdp, label = data_gdp$country, color = 4, vjust = 1.5) +
  labs(y="life expectancy", x="GDP per capita") +
  theme_bw()
p1

## Modify the R code for the previous problem and recreate a new graph.
p2 <- ggplot(data=data_2007, aes(x=gdpPercap, y=lifeExp)) +
  geom_point(shape = 1) +
  labs(x = "GDP per capita", y = "life expectancy")

data_gdp2 <- data_2007 %>%
  filter(continent == "Europe") %>%
  arrange(desc(gdpPercap)) %>%
  head(6)

p2 <- p2 +
  geom_rect(data = data_gdp2, aes(xmin = 39000, xmax = 51000,
                                  ymin = 75, ymax = 85),
            fill = 2, alpha = 0.05) +
  annotate("text", x = 45000, y = 71, label = "Countries with \n highest GDP") +
  theme_bw()
p2













