library(readr)
library(dplyr)
library(rpart)
library(tidyr)
library(gluskr)

# train and test data split
nicole_df <- transit_qol_df
set.seed(123)
nicole_df_master <- nicole_df[complete.cases(nicole_df),]
n <- nrow(nicole_df_master)
train_id <- sample(1:n, size=round(n*0.8)) # select approx 80% of the row numbers between 1 and n
train <- nicole_df_master[train_id,] # the data set we'll train the model on
test <- nicole_df_master[-train_id,]


# passenger_trips
train_pass <- train %>% drop_na("gdp_msa")
tree_pass <- rpart("gdp_msa ~ passenger_trips", data=train_pass)
  
pred_pass <- as.vector(predict(tree_pass, test)) # a vector of probabilities
test_pass <- test %>% mutate(prediction = pred_pass)
  
test_pass$truth <- test[,"gdp_msa"]
results_pass <- test_pass %>%
  summarise("Response Variable" = "passenger_trips",
              MSE = 1/n() * sum((truth - pred_pass)^2, na.rm = T),
              MAE  = 1/n() * sum(abs(truth - pred_pass), na.rm = T),
              R2   = cor(truth, pred_pass))

# results_workers
train_workers <- train %>% drop_na("gdp_msa")
tree_workers <- rpart("gdp_msa ~ percent_workers_commuting_by_public_transit_msa", data=train_workers)

pred_workers <- as.vector(predict(tree_workers, test)) # a vector of probabilities
test_workers <- test %>% mutate(prediction = pred_workers)

test_workers$truth <- test[,"gdp_msa"]
results_workers <- test_workers %>%
  summarise("Response Variable" = "percent_workers_commuting_by_public_transit_msa",
            MSE = 1/n() * sum((truth - pred_workers)^2, na.rm = T),
            MAE  = 1/n() * sum(abs(truth - pred_workers), na.rm = T),
            R2   = cor(truth, pred_workers))

# results_pop
train_pop <- train %>% drop_na("gdp_msa")
tree_pop <- rpart("gdp_msa ~ pop_estimate_msa", data=train_pop)

pred_pop <- as.vector(predict(tree_pop, test)) # a vector of probabilities
test_pop <- test %>% mutate(prediction = pred_pop)

test_pop$truth <- test[,"gdp_msa"]
results_pop <- test_pop %>%
  summarise("Response Variable" = "pop_estimate_msa",
            MSE = 1/n() * sum((truth - pred_pop)^2, na.rm = T),
            MAE  = 1/n() * sum(abs(truth - pred_pop), na.rm = T),
            R2   = cor(truth, pred_pop))

# results_pass_workers
train_pass_workers <- train %>% drop_na("gdp_msa")
tree_pass_workers <- rpart("gdp_msa ~ percent_workers_commuting_by_public_transit_msa + passenger_trips", data=train_pass_workers)

pred_pass_workers <- as.vector(predict(tree_pass_workers, test)) # a vector of probabilities
test_pass_workers <- test %>% mutate(prediction = pred_pass_workers)

test_pass_workers$truth <- test[,"gdp_msa"]
results_pass_workers <- test_pass_workers %>%
  summarise("Response Variable" = "percent_workers_commuting_by_public_transit_msa + passenger_trips",
            MSE = 1/n() * sum((truth - pred_pass_workers)^2, na.rm = T),
            MAE  = 1/n() * sum(abs(truth - pred_pass_workers), na.rm = T),
            R2   = cor(truth, pred_pass_workers))

# results_pass_pop
train_pass_pop <- train %>% drop_na("gdp_msa")
tree_pass_pop <- rpart("gdp_msa ~ passenger_trips + pop_estimate_msa", data=train_pass_pop)

pred_pass_pop <- as.vector(predict(tree_pass_pop, test)) # a vector of probabilities
test_pass_pop <- test %>% mutate(prediction = pred_pass_pop)

test_pass_pop$truth <- test[,"gdp_msa"]
results_pass_pop <- test_pass_pop %>%
  summarise("Response Variable" = "passenger_trips + pop_estimate_msa",
            MSE = 1/n() * sum((truth - pred_pass_pop)^2, na.rm = T),
            MAE  = 1/n() * sum(abs(truth - pred_pass_pop), na.rm = T),
            R2   = cor(truth, pred_pass_pop))

# results_workers_pop
train_workers_pop <- train %>% drop_na("gdp_msa")
tree_workers_pop <- rpart("gdp_msa ~ percent_workers_commuting_by_public_transit_msa + pop_estimate_msa", data=train_workers_pop)

pred_workers_pop <- as.vector(predict(tree_workers_pop, test)) # a vector of probabilities
test_workers_pop <- test %>% mutate(prediction = pred_workers_pop)

test_workers_pop$truth <- test[,"gdp_msa"]
results_workers_pop <- test_workers_pop %>%
  summarise("Response Variable" = "percent_workers_commuting_by_public_transit_msa + pop_estimate_msa",
            MSE = 1/n() * sum((truth - pred_workers_pop)^2, na.rm = T),
            MAE  = 1/n() * sum(abs(truth - pred_workers_pop), na.rm = T),
            R2   = cor(truth, pred_workers_pop))

# results_pass_workers_pop
train_pass_workers_pop <- train %>% drop_na("gdp_msa")
tree_pass_workers_pop <- rpart("gdp_msa ~ percent_workers_commuting_by_public_transit_msa + passenger_trips + pop_estimate_msa", 
                               data=train_pass_workers_pop)

pred_pass_workers_pop <- as.vector(predict(tree_pass_workers_pop, test)) # a vector of probabilities
test_pass_workers_pop <- test %>% mutate(prediction = pred_pass_workers_pop)

test_pass_workers_pop$truth <- test[,"gdp_msa"]
results_pass_workers_pop <- test_pass_workers_pop %>%
  summarise("Response Variable" = "percent_workers_commuting_by_public_transit_msa + passenger_trips + pop_estimate_msa",
            MSE = 1/n() * sum((truth - pred_pass_workers_pop)^2, na.rm = T),
            MAE  = 1/n() * sum(abs(truth - pred_pass_workers_pop), na.rm = T),
            R2   = cor(truth, pred_pass_workers_pop))

final_table <- rbind(results_pass, results_workers, results_pop,
                    results_pass_workers, results_pass_pop,
                   results_workers_pop, results_pass_workers_pop)

View(final_table)
