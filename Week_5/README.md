# Ria's Week 5 progress
## Circular bar plot created based upon the fundamentals.csv data
##### This plot was made using the tidyverse and viridis package - The yellow section represents the Cash. Ratio, the green section represents the Current.Ratio and the purple section represents the Gross.Margin.  The code for this graph was very complex due to the circular style, it was necessary to create gaps between the ticker symbol groups and a grid foundation structure.

<img width="488" alt="Screen Shot 2022-08-02 at 14 45 17" src="https://user-images.githubusercontent.com/78815761/182390147-d4357273-61dd-42a9-aa16-d05b5edc967b.png">

| X | Ticker Symbol  | CASH  |
| - |:--------------:| -----:|
| 0 | AAL            | 53    |
| 1 | AAL            | 75    |
| 2 | AAL            | 60    |
| 3 | AAL            | 51    |
| 4 | AAP            | 23    |
| 5 | AAP            | 40    |
| 6 | AAP            | 3     |
| 7 | AAP            | 2     |
| 8 | AAPL           | 93    |
| 9 | AAPL           | 40    |
| 10| AAPL           | 52    |
| 11| AAPL           | 85    |
| 12| ABBV           | 118   |
| 13| ABBV           | 144   |
| 14| ABBV           | 74    |
| 15| ABBV           | 77    |
| 16| ABC            | 8     |
| 17| ABC            | 10    |
| 18| ABC            | 10    |
| 19| ABC            | 11    |
| 20| ABT            | 114   |
| 21| ABT            | 85    |
| 22| ABT            | 43    |
| 23| ABT            | 67    |
| 24| ABDE           | 208   |
| 25| ABDE           | 150   |
| 26| ABDE           | 180   |
| 27| ABDE           | 169   |
| 28| ADI            | 821   |
| 29| ADI            | 404   |
| 30| ADI            | 272   |

## Exploring the circular packing interactive plot
##### This table represents a subset of the fundamentals data sheet and the web link allows the interactive packing circles plot to be accessed which demonstrates the data in the table. The packing circles plot has been made such that the larger the Cash.Ratio of the company/Ticker symbol individual, the greater the radius of the circle.

https://5e723c00a5ab4d19bdff076dc7baf09f.app.rstudio.cloud/file_show?path=%2Fcloud%2Fproject%2FPackingCircles.html

<img width="508" alt="Screen Shot 2022-08-04 at 21 55 43" src="https://user-images.githubusercontent.com/78815761/182951080-4679629e-3f3b-4636-bef3-7956eb2712cb.png">

## Exploring animated plots
#####  The animated bubble chart below was made in ordedr to show the relationship betwen After Tax ROE and Cash Ratio data from the years 2012-2016 and the gif shows the progression in figures using animation. From 2012-2016 the values figures seem to be increasing in value. The differing colours represent the different Ticker symbols here as shown by the legend. 

![AnimatedBubble](https://user-images.githubusercontent.com/78815761/182946638-cd76548d-3aa6-44eb-9cd7-8a36799e4bb3.gif)
### I was able to create the same animated plot in python using plotly package as shown below, the Jupyter notebook script has been attatched.

![newplot (1)](https://user-images.githubusercontent.com/78815761/182959885-25ee7a2a-b750-4462-be2e-e192581735a3.png)

##### The animated plot below demonstrates the same data as above however instead I have used the facet function to split groups amongst the Ticker Symbol coloumn

![Facet](https://user-images.githubusercontent.com/78815761/182949782-125f31e3-475f-4646-a76b-35f8fd431b6e.gif)

##### The animated plot below demonstrates the cash.Ratio data from the fundamentals.csv

![CashRatio](https://user-images.githubusercontent.com/78815761/182941594-4026ec97-a13b-4d65-96b0-34f4fd802f21.gif)

## Using the healthcare data set
##### I combined the dentists.csv, pharmactists.csv and medicaldoctors.csv together in order to make a new data frame and the following plots - an animated bubble plot and a Hex Plot.

![DoctorsVsDentists](https://user-images.githubusercontent.com/78815761/183078676-548a8c4f-37b8-4be4-b8c2-1bf33a2b59b6.gif)

![DoctorsvsDentistHexPlot](https://user-images.githubusercontent.com/78815761/183078709-bc6edb84-d2e2-42a5-8e62-0a7b9bca57dd.png)




