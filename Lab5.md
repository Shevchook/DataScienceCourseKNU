# LAB 5

```{r}
# Creating the list of CSV files only
specdata <- list.files("D:/R/3rdATTEMPT/specdata/", pattern = "*.csv")

# Read in each CSV file in file list and
# create a data frame with the same name as the CSV file
for (i in 1:length(specdata)) {
    assign(specdata[i],
    read.csv(paste("D:/R/3rdATTEMPT/specdata/", specdata[i], sep=''))
)}

# Creating the function pmean
pmean <- function(specdata, pollutant, id) {
  # I have no idea
}
```