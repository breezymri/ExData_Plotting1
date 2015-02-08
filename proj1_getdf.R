library(RSQLite)
library(lubridate)

# read in the data for project 1
proj1_getdf <- function() {
    txt_name <- 'household_power_consumption.txt'
    target_db_name <- 'proj1_db.sqlite'
    target_table_name <- 'proj1_table'

    # convert the data into a SQL database for easy querying
    if(!file.exists(target_db_name)){
        con <- dbConnect(RSQLite::SQLite(), dbname=target_db_name)
        dbWriteTable(con, name=target_table_name, value=txt_name, 
            row.names=FALSE, header=TRUE, sep=';')
    }
    else{
        # if conversion was done, just connect to the database
        con <- dbConnect(RSQLite::SQLite(), dbname=target_db_name)
    }
    # read in data for the specified two days
    mydata <- dbGetQuery(con, 
        sprintf('SELECT * FROM %s WHERE Date="1/2/2007" OR Date="2/2/2007"', target_table_name))

    # disconnect the database
    dbDisconnect(con)

    return(mydata)
}
