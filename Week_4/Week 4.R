application <- read.csv("application_record.csv",header = TRUE, stringsAsFactors=T,check.names = FALSE)
df <- application[c(1:100)]
application_glm <- glm (FLAG_OWN_CAR ~ NAME_FAMILY_STATUS + OCCUPATION_TYPE + NAME_INCOME_TYPE + AMT_INCOME_TOTAL,
                        family="binomial",
                        data=df)
library(ggplot2)
library(visreg)
visreg(application_glm, "AMT_INCOME_TOTAL", 
       gg = TRUE, 
       scale="response") +
  labs(y = "Prob(Owning a car)", 
       x = "Total Income (£)",
       title = "Relationship of Income and Probability of owning a car",
       subtitle = "controlling for Income type, family status and occupation type",
       caption = "source: Applications data")

visreg(application_glm, "AMT_INCOME_TOTAL",
       by = "OCCUPATION_TYPE",
       gg = TRUE, 
       scale="response") +
  labs(y = "Prob(Owning a car)", 
       x = "Total Income (£)",
       title = "Relationship between Income and Owning a car",
       subtitle = "controlling for family status and occupation type and subset by income type",
       caption = "source: Applications data")

library(survival)
library(survminer)

# Haberman cancer survival data set - data based upon the survival rates of candidates who has undergone surgeory for breast cancer

survival <- read.csv("haberman.csv",header = TRUE)
plot_data <- subset(survival, survival$nodes=="1")
plot_data_1 <- subset(survival, survival$nodes=="4")

plotdata2 <-rbind(plot_data, plot_data_1)
sfit <- survfit(Surv(age, status) ~  1, data=survival)
ggsurvplot(sfit,
           title="Kaplan-Meier curve for Breast cancer surgeory survival",
           xlab = "Age", 
           ylab = "Overall survival probability",
           xlim = c(40, 80))

sfit <- survfit(Surv(age, status) ~  nodes, data=plotdata2)
ggsurvplot(sfit, 
           conf.int=TRUE, 
           pval=TRUE,
           legend.labs=c("1", "4"), 
           legend.title="Nodes",  
           palette=c("cornflowerblue", "indianred3"), 
           title="Kaplan-Meier Curve for Breast cancer surgeory survival",
           xlab = "Time (days)")

library(readr)
library(vcd)
d
tbl <- xtabs(~ CNT_CHILDREN + CODE_GENDER + FLAG_OWN_CAR, df)
table(tbl)
mosaic(tbl, main = "Applications data")

mosaic(tbl, 
       shade = TRUE,
       legend = TRUE,
       labeling_args = list(set_varnames = c(CNT_CHILDREN = "Number of children",
                                             CODE_GENDER = "Gender",
                                             FLAG_OWN_CAR = "Do they own a car?")),
       set_labels = list(CODE_GENDER = c("Boy", "Girl"),
                         CNT_CHILDREN = c("0", "1", "2", "3"),
                         FLAG_OWN_CAR = c("Yes", "No")),
       main = "Applications data")
