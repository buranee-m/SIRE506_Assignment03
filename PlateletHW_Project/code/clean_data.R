#Import raw data
library(readr)
PlateletHW <- read_tsv("raw_data/PlateletHW.tsv")
PlateletHW
dim(PlateletHW)
#Check for an ouliners
quantiles <- quantile(PlateletHW$ADP, probs = c(0.25, 0.75))
iqr <- quantiles[2] - quantiles[1]
upper_limit <- quantiles[2] + 1.5 * iqr
lower_limit <- quantiles[1] - 1.5 * iqr
outliers <- PlateletHW$ADP[PlateletHW$ADP < lower_limit | PlateletHW$ADP > upper_limit]
print(outliers)
#Clean data
library(dplyr)
PlateletHW_clean <- PlateletHW %>%filter(ADP >= lower_limit & ADP <= upper_limit)
summary(PlateletHW_clean$ADP)
write_tsv(PlateletHW_clean,"clean_data/PlateletHW_clean.tsv")
head(PlateletHW_clean)