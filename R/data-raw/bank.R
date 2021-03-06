library(foreign)
bank <- read.spss("C:/q/Install/Examples/Satisfaction with missing data.sav",
                  to.data.frame = TRUE)
set.seed(54543)
bank[runif(nrow(bank)) < 0.1, 2] <- NA #Adding missing values to the dependent variable
devtools::use_data(bank, internal = FALSE, overwrite = TRUE)

missing = "Error if missing data"
LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, missing = missing)


LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank)
LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, robust.se = TRUE)

missing <- "Exclude cases with missing data"
LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, missing = missing)
LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, subset = bank$ID > 100, missing = missing)
LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, weights = bank$ID, missing = missing)
LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, weights = bank$ID, subset = bank$ID > 100, missing = missing)

missing <- "Imputation"
LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, missing = missing)
LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, subset = bank$ID > 100, missing = missing)
LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, weights = bank$ID, missing = missing)
LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, weights = bank$ID, subset = bank$ID > 100, missing = missing)

missing <- "Use partial data (pairwise)"
LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, missing = missing)
LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, subset = bank$ID > 100, missing = missing)
LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, weights = bank$ID, missing = missing)
LinearRegression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM, data = bank, weights = bank$ID, subset = bank$ID > 100, missing = missing)
