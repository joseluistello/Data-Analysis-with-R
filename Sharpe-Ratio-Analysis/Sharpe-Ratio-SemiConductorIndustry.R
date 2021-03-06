## Library

library(tidyverse)
library(tidyquant)


## Download data

fabless <- c("NVDA", "AVGO", "QCOM") %>%
  tq_get(get  = "stock.prices",
         from = "2015-01-01",
         to   = "2021-10-10") 


Ra <- c("NVDA", "AVGO", "QCOM") %>%
  tq_get(get  = "stock.prices",
         from = "2015-01-01",
         to   = "2021-10-10") %>%
  group_by(symbol) %>%
  tq_transmute(select = adjusted, 
               mutate_fun = periodReturn, 
               period = "monthly", 
               col_rename = "Ra")

Rb <- "XLK" %>%
  tq_get(get  = "stock.prices",
         from = "2015-01-01",
         to   = "2021-10-10") %>%
  tq_transmute(select = adjusted, 
               mutate_fun = periodReturn, 
               period = "monthly", 
               col_rename = "Rb")

#### Combine data

RaRb <- left_join(Ra, Rb, by = c("date" = "date"))

RaRb_capm <- RaRb %>%
  tq_performance(Ra = Ra, 
                 Rb = Rb, 
                 performance_fun = table.CAPM)

#### Analysis


ggplot(fabless, 
       aes(x = date, y = close, color = symbol)) + 
  geom_line(size=1) +
  labs(title = "Semiconductor Stock Price",
       subtitle = 'Fabless companies',
       x = 'Date',
       y =  "Close Price") +
  theme_minimal() +
  scale_color_brewer(palette = "Dark2")


