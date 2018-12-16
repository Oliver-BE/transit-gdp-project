# Data import

library(readr)

transit_qol_df <- read_csv("data-raw/FINAL_DATA.csv")

# Data processing code here...

# This should be the last line
devtools::use_data(transit_qol_df, overwrite = T)
