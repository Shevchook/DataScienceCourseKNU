# LAB 5

```{r}
# Створення листа з файлів CSV
specdata <- list.files("D:/R/3rdATTEMPT/specdata/", pattern = "*.csv")

# Читання файлів CSV та створення з них датафреймів
for (i in 1:length(specdata)) {
    assign(specdata[i],
    read.csv(paste("D:/R/3rdATTEMPT/specdata/", specdata[i], sep=''))
)}

# Creating the function pmean
pmean <- function(specdata, pollutant, id) {
  # Не уявляю що тут писати
}
```