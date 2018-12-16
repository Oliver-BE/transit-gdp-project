library(gluskr)
library(dplyr)
library(jsonlite)
library(httr)
library(rvest)
library(readxl)
library(tidyverse)
library(mdsr)   
library(tidyr)
library(ggplot2)
library(readr)
library(knitr)
library(rpart)
library(partykit)
library(pROC)
library(rpart.plot)

# seperate train and test data 
nicole_df <- readRDS("./final-data/final_data.RDA") %>% 
  mutate(avg_speed = vehicle_miles / vehicle_hours)

set.seed(2)

# only take rows with all data present
nicole_df_master <- nicole_df[complete.cases(nicole_df),]

n <- nrow(nicole_df_master)
train_id <- sample(1:n, size=round(n*0.8)) # select approx 80% of the row numbers between 1 and n

# the data we'll train the model on
train_data <- nicole_df_master[train_id,]

# the data we'll test the model on 
test_data <- nicole_df_master[-train_id,]

# function to make a regression tree model with response variable per_capita_gdp
gdp_model <- function(explanatory_variables) {
  final_train_data <- train_data %>% drop_na("per_capita_gdp")
  regression_formula <- paste0("per_capita_gdp ~ ", explanatory_variables)
  regression_tree <- rpart(regression_formula, data=final_train_data)
  predictions <- as.vector(predict(regression_tree, test_data)) # a vector of probabilities
  final_test_data <- test_data %>% mutate(prediction = predictions)
  final_test_data$truth <- final_test_data[,"per_capita_gdp"]
  results <- final_test_data %>%
    summarise("Explanatory Variables" = explanatory_variables,
              MSE = 1/n() * sum((truth - predictions)^2, na.rm = T),
              MAE  = 1/n() * sum(abs(truth - predictions), na.rm = T),
              R2   = cor(truth, predictions))
  
  return(results)
}


# use our function on different explanatory variables
pass_trips <- gdp_model("passenger_trips")
# rpart.plot(pass_trips)

workers <- gdp_model("percent_workers_commuting_by_public_transit_msa")

pass_trips_workers <- gdp_model("percent_workers_commuting_by_public_transit_msa + passenger_trips")
tot_funding <- gdp_model("total_funding")
fund_trips_workers <- gdp_model("percent_workers_commuting_by_public_transit_msa + passenger_trips + total_funding")

all_transit <- gdp_model("passenger_trips + avg_speed + total_funding")
rpart.plot(all_transit)

# combine results of each combination of explanatory variables
model_results <- rbind(pass_trips, workers, pass_trips_workers, tot_funding,
                       fund_trips_workers, all_transit)

View(model_results)
