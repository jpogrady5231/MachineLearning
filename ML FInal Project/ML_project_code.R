loan_data <- read.csv("Downloads/loan_approval_dataset 3.csv") # Load loan dataset

summary(loan_data)

nrow(unique(loan_data)) # Check unique rows in dataset


summary(as.factor(loan_data$loan_status))


library(ggplot2) 
library(reshape) 
library(glmnet)  
library(plotmo) 


plot_dat <- loan_data 
plot_dat$loan_status <-  as.factor(loan_data$loan_status)

g_1 <- ggplot(plot_dat, aes(x = income_annum, fill = loan_status)) + 
  geom_density(alpha = 0.5) + 
  theme_set(theme_bw(base_size = 22) ) + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        panel.border = element_blank(), 
        panel.background = element_blank()) + 
  labs(x = "Annual Income", title = "Annual Income",
       fill = "loan_status") + 
  scale_fill_manual(values = c("1" = "red", "0" = "blue"), 
                    labels = c("1" = "Approved", "0" = "Rejcted")) 
g_1 



g_2 <- ggplot(plot_dat, aes(x = education, fill = loan_status)) + 
  geom_bar(alpha = 0.5, position = "dodge") + 
  theme_set(theme_bw(base_size = 22) ) + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        panel.border = element_blank(), 
        panel.background = element_blank()) + 
  labs(x = "Graduate Status", title = "Education Level?",
       fill = "loan_status") + 
  scale_fill_manual(values = c("1" = "red", "0" = "blue"), 
                    labels = c("1" = "approved", "0" = "rejected")) 


g_2
