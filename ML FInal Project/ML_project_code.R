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

library(ggplot2) 
library(reshape) 
library(glmnet)  
library(plotmo) 


plot_dat <- loan_data 
plot_dat$loan_status <-  as.factor(loan_data$loan_status)
```

```{r}
    g_1 <-ggplot(loan_data, aes(x = income_annum)) + # Set X-axis as insurance charges
  geom_density(fill = "blue", alpha = 0.5) + # Use geom_density to get density plot
  theme_bw() + # Set theme for plot
  theme(panel.grid.major = element_blank(), # Turn of the background grid
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank()) 
g_1 # Generate plot


#need to figure out how to fix the color for plot g_1_1 and g_2

g_1_1 <- ggplot(plot_dat, aes(x = cibil_score, fill = loan_status)) + 
  geom_density(alpha = 0.5) +
    theme_set(theme_dark(base_size = 22) ) + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        panel.border = element_blank(), 
        panel.background = element_blank()) + labs(x = "Credit SCore", title = "Credit Score - Status",fill = "loan_status")  #+scale_fill_manual(values = c("Approved" = "red", "Rejected" = "blue"), labels = c("Approved","Rejected")) 
g_1_1 



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
