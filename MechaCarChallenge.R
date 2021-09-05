# -- DELIVERABLE 1 --
# import dependencies
library(tidyverse)
package="ggplot2"
# import and read csv as a dataframe
mpg_data <- read.csv('MechaCar_mpg.csv')
head(mpg_data)
# Perform linear regression using the lm() function
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + 
             AWD ,data=mpg_data))
# use summary() to determine p-value and r-squared
# p value: 5.35e-11
# Adjusted R-squared:  0.6825 
# -- DELIVERABLE 2 --
# import data into a table
suspension <- read.csv('Suspension_Coil.csv', stringsAsFactors = F)
#  use summarize, create a total_summary DF by PSI
total_summary <- suspension %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
# create a DF filtered
lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
# -- DELIVERABLE 3 --
#determine if  PSI across  manufacturing lots is statistically different from  population mean of 1,500 PSI
t.test(lot_summary$Mean, mu=1500)
# write 3 scripts for each lot to t.test
Lot1 = subset(suspension, Manufacturing_Lot == 'Lot1')
t.test(Lot1$PSI, mu =1500)

Lot2 = subset(suspension, Manufacturing_Lot == 'Lot2')
t.test(Lot2$PSI, mu =1500)

Lot3 = subset(suspension, Manufacturing_Lot == 'Lot3')
t.test(Lot3$PSI, mu =1500)
