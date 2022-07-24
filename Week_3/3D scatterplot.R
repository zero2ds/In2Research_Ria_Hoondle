mtcars
correlation_data
library(scatterplot3d)
with(correlation_data, {
  scatterplot3d(x = cancer_diagnosis_probability_from_30_70,
                y = road_traffic_deaths, 
                z = doctors_available_per_10000,
                pch=19,
                color= as.numeric(as.factor(Location)),
                main = "Global healthcare in 2010",
                xlab = "% Probability of cancer diagnosis from ages 30-70",
                ylab = "Road traffic deaths",
                zlab = "Doctors available per 10000 people")
})



