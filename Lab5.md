# LAB 5

```{r}
# ��������� ����� � ����� CSV
specdata <- list.files("D:/R/3rdATTEMPT/specdata/", pattern = "*.csv")

# ������� ����� CSV �� ��������� � ��� ����������
for (i in 1:length(specdata)) {
    assign(specdata[i],
    read.csv(paste("D:/R/3rdATTEMPT/specdata/", specdata[i], sep=''))
)}

# Creating the function pmean
pmean <- function(specdata, pollutant, id) {
  # �� ������ �� ��� ������
}
```