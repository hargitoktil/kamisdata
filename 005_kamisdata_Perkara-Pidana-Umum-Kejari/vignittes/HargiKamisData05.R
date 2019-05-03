library(dplyr)
library(hflights)
install.packages("RMySQL")
# Set up a connection to the mysql database
my_db <- src_mysql(dbname = "dplyr", 
                   host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                   port = 3306, 
                   user = "student",
                   password = "datacamp")
nycflights <- tbl(my_db, "dplyr")
names(nycflights)

glimpse(nycflights)

# Ordered, grouped summary of nycflights
nycflights %>% group_by(carrier) %>%
  summarize (n_flights = n_distinct(carrier), avg_delay = mean(arr_delay)) %>%
  arrange(avg_delay)


# decision tree, svm, neural network, deep learning, 
# kNN, regression, random forest, logistic regression, bayesian, LVQ
# LSTM 
# deep learning terkenal karena GPU, hardware graphic card ada processor-nya
# processor dalam graphic card, NVIDIA biasanya, 
# kaggle competition, 
# transfer learning, orang 
# ada biaya bikin model, karena mesti sewa cloud
#left join





