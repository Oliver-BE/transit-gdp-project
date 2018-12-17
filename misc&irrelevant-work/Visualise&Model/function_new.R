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
nicole_df <- readRDS("./final-data/final_data.RDA") 

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

### percent_commuting_msa .09
# total_transit_expenses
# total_fares
# directional_route_miles
# vehicle_hours
# vehicle_miles
# passenger_miles
# passenger_trips
# total_funding
# pmt_per_vrm
# pmt_per_vrh
# upt_per_vrh
# per_capita_vrm
# per_capita_vrh
### per_capita_pmt .007
### per_capita_upt .005
### recovery_ratio .0036
# fares_per_upt
### cost_per_hour .00345
# cost_per_trip
# cost_per_pmt

# use our function on different explanatory variables
a <- gdp_model("percent_commuting_msa")
b <- gdp_model("total_transit_expenses")
c <- gdp_model("directional_route_miles")
d <- gdp_model("vehicle_hours")
e <- gdp_model("passenger_miles")
f <- gdp_model("passenger_trips")
g <- gdp_model("total_funding")
h <- gdp_model("pmt_per_vrm")
i <- gdp_model("pmt_per_vrh")
j <- gdp_model("upt_per_vrh")
k <- gdp_model("per_capita_vrm")
l <- gdp_model("per_capita_vrh")
m <- gdp_model("per_capita_pmt")
n <- gdp_model("per_capita_upt")
o <- gdp_model("recovery_ratio")
p <- gdp_model("fares_per_upt")
q <- gdp_model("cost_per_hour")
r <- gdp_model("cost_per_trip")
s <- gdp_model("cost_per_pmt")

# combine results of each combination of explanatory variables
model_results <- rbind(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s)

View(model_results)

###############################################################

# per_capita_vrm
# percent_commuting_msa
# per_capita_pmt
# per_capita_vrh

# get model results 
# one explanatory variable
model1 <- gdp_model("per_capita_vrm")
model2 <- gdp_model("percent_commuting_msa")
model3 <- gdp_model("per_capita_pmt")
model4 <- gdp_model("per_capita_vrh")

# two explanatory variables
model4 <- gdp_model("per_capita_vrm + percent_commuting_msa")
model5 <- gdp_model("per_capita_vrm + per_capita_pmt")
model6 <- gdp_model("per_capita_vrm + per_capita_vrh")
model7 <- gdp_model("percent_commuting_msa + per_capita_pmt")
model8 <- gdp_model("percent_commuting_msa + per_capita_vrh")
model9 <- gdp_model("per_capita_pmt + per_capita_vrh")

# three explanatory variables
model10 <- gdp_model("per_capita_vrm + percent_commuting_msa + per_capita_pmt")
model11 <- gdp_model("per_capita_vrm + per_capita_pmt + per_capita_vrh")
model12 <- gdp_model("per_capita_vrm + percent_commuting_msa + per_capita_vrh")
model13 <- gdp_model("percent_commuting_msa + per_capita_pmt + per_capita_vrh")

# all four explanatory variables
model14 <- gdp_model("per_capita_vrm + percent_commuting_msa + per_capita_pmt + per_capita_vrh")

#extras
model15 <- gdp_model("per_capita_vrm + per_capita_vrh + per_capita_upt")
model16 <- gdp_model("per_capita_vrm + per_capita_vrh + recovery_ratio")
model17 <- gdp_model("per_capita_vrm + percent_commuting_msa + per_capita_vrh + transit_modes")
model18 <- gdp_model("percent_commuting_msa + per_capita_pmt + transit_modes")
model19 <- gdp_model("per_capita_vrm + per_capita_vrh + transit_modes")

# 17 is best

final_model <- rbind(model1, model2, model3, model4, model5, model6, model7,
                     model8, model9, model10, model11, model12, model13, model14, model15,
                     model16, model17, model18, model19)
View(final_model)



# function to make a regression tree model with response variable per_capita_gdp
tree_model <- function(explanatory_variables) {
  final_train_data <- train_data %>% drop_na("per_capita_gdp")
  regression_formula <- paste0("per_capita_gdp ~ ", explanatory_variables)
  regression_tree <- rpart(regression_formula, data=final_train_data)
  return(regression_tree)
}

asdf <- tree_model("percent_commuting_msa + per_capita_pmt")
rpart.plot(asdf)
