library(xlsx)
location <- read.xlsx("location.xlsx", sheetName = "Sheet1", stringsAsFactors = FALSE)
locationdata <- read.xlsx("locationdata.xlsx", sheetName = "Sheet1", stringsAsFactors = FALSE)
incidentdata <- read.xlsx("incidentdata.xlsx", sheetName = "Sheet1", stringsAsFactors = FALSE)
colnames(location) <- "Location"
