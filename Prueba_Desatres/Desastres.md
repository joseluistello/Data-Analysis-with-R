---
title: "Disasteers"
author: "José Luis Tello"
date: "5/11/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```


```{r cars}
library(tidyverse)
library(readr)

df <- read_csv("1900_2021_DESASTRES.csv")
```

# Primer problema con Query

```{r}
df %>% count(Year, Country, DisasterType) %>% filter (n > 10)
```


### SELECT Year, Country, count(DisasterType) as Disasters 
### FROM df
### WHERE Disasters >= 10
### Group by Year, Country



# Segundo problema con Query


```{r}
df %>% count(Year, Country, DisasterType) %>% filter (n > 10) %>% arrange(desc(Year))
```


### SELECT Year, Country, count(DisasterType) as Disasters 
### FROM df
### WHERE Disasters >= 10
### GROUP BY Year, Country
### ORDER BY Year DESC;

