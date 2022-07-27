# Ria's Week 4 progress
## Simple linear regression plots and correlation plots

<img width="450" alt="Screen Shot 2022-07-25 at 11 49 32" src="https://user-images.githubusercontent.com/78815761/180797221-27524efd-157e-4bcd-9247-1d1b5c56dadd.png">
<img width="450" alt="Screen Shot 2022-07-25 at 11 49 41" src="https://user-images.githubusercontent.com/78815761/180797242-a1fe971b-1d4a-47a7-ad96-a97fc003d160.png">

The correlation plots above were created using the corrplot package and demonstrate the correlation between variables : Period.Ending, Accounts.Payable,  Accounts.Receivable, After.Tax.ROE, Capital.Expenditures, Cash.Ratio, Cash.and.Cash.Equivalents from the 'fundamentals.csv' data.

<img width="449" alt="Screen Shot 2022-07-25 at 12 19 36" src="https://user-images.githubusercontent.com/78815761/180797254-7acab79f-c0d1-46de-81c1-9599cd3c4382.png">

This conditional plot above explains the correlation between Gross profits and Investment data between the years 2000-2016
## Exploring multiple regression
<img width="509" alt="Screen Shot 2022-07-27 at 12 11 36" src="https://user-images.githubusercontent.com/78815761/181235236-1928745b-a910-411d-aa99-f4ad2d3be496.png">
The diagnostic plot above demonstrates the relationship  between ' Cash.Ratio ~ Cost.of.Revenue + Earnings.Before.Tax + Fixed.Assets' and a summary of this data can be seen in the image below
<img width="309" alt="Screen Shot 2022-07-27 at 12 11 53" src="https://user-images.githubusercontent.com/78815761/181235529-14c25b59-4ee1-42fb-9375-09981073c2bb.png">
## Exploring Logistic regression
<img width="518" alt="Screen Shot 2022-07-27 at 13 08 32" src="https://user-images.githubusercontent.com/78815761/181243787-c39304b1-a4c9-4bdc-9dd2-1c5d03aced15.png">
Using the 'applications.csv' file, I was able to perfrom logistics regression and plot the regression data, the plot above generally explains to us that the higher the average total income per individual, the larger the probability there is for owning their own car. 
<img width="518" alt="Screen Shot 2022-07-27 at 13 23 36" src="https://user-images.githubusercontent.com/78815761/181245912-12ddb9a9-36d6-49d4-8902-07bd4fd9207c.png">
***Same graph except faceted by Occupation*** - This graph demonstrates the same positive correlation for each occupation type however for a pensioner we can see the probability of owning your own car is very high despite income levels - this is an example of multinomial logistic regression
## Survival plots using Survival rate data of individuals of which have experienced Breast Cancer Surgeory<img width="399" alt="Screen Shot 2022-07-27 at 21 14 39" src="https://user-images.githubusercontent.com/78815761/181364205-c4cc542d-a2ee-4e32-bc46-d741ad8f4aeb.png">
<img width="399" alt="Screen Shot 2022-07-27 at 21 14 02" src="https://user-images.githubusercontent.com/78815761/181364215-33bd3d09-7813-4da6-ae35-2327383faa64.png">
The p value of 0.39 is very large suggesting there is not enough evidence to suggest the difference in survival rates betweeen those with 1 node and 4 nodes is due to a signifigant contributing factor.
