rm(list = ls())
library(xml2)
library(rvest)

setwd("/Users/syu/Library/CloudStorage/OneDrive-St.JudeChildren'sResearchHospital/UDrive/Documents_syu_Backup/Github_deposit/MoviesFranchises")

moviefranch.url <- "http://www.the-numbers.com/movies/franchises/"

# read_html is used to read/extract the html content of a webpage, the output is a list
moviefranch.page <- read_html(moviefranch.url, options = c("NOBLANKS", "NSCLEAN", "DTDLOAD"))

# write scraped data into a file
write(as.character(moviefranch.page), "moviefranch_bgt.txt", sep = "\t")
print(moviefranch.page)

# html_nodes function is used to identify the nodes in html document, the output is lists
table.nodes <- html_nodes(moviefranch.page, xpath = "//table")
# directly use node name for node selection
html_table(read_html(moviefranch.url, "table"), trim = T, fill = T)

franch.table <- html_table(table.nodes, trim = T, fill = T)
write.csv(franch.table, file = "MovieFranchise_FinanceInfo.csv")


# set another url for scrapping historic inflation data
cpi.url <- "https://inflationdata.com/Inflation/Consumer_Price_Index/HistoricalCPI.aspx?reloaded=true"

# extract the html content of a webpage, the output is a list
cpi.page <- read_html(cpi.url, options = c("NOBLANKS", "NSCLEAN", "DTDLOAD"))

# identify the nodes in html document, the output is lists
inflation.table.node <- html_nodes(cpi.page, xpath = ".//table")

# directly load all nodes and use html_table to automatically parse table 
html_table(read_html(cpi.url), trim = T, fill = T)
# or load table nodes into html_table
inflation.table <- html_table(inflation.table.node, trim = T, fill = T)
write.csv(inflation.table, file = "CPIHistoricInflationData.csv")


