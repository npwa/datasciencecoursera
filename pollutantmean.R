## This function calculates the mean of a pollutant (sulfate or
## nitrate) across a specified list of monitors. The function
## 'pollutantmean' takes three arguments: 'directory', 'pollutant',
## and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads
## that monitors' particulate matter data from the directory specified
## in the 'directory' argument and returns the mean of the pollutant
## across all of the monitors, ignoring any missing values coded as NA

pollutantmean <- function(directory,pollutant,id=1:332)
{
    ## pollutant - "sulfate" or "nitrate"
    ## ignore NA values
    fi <- list.files(path=directory,pattern=".csv",full.names=T)

    ## initialize empty vector
    val <- numeric()

    ## loop over all required IDs, add pollutant data
    for (i in id) {
        dat <- read.csv(fi[i])
        val <- c(val,dat[[pollutant]])
    }

    ## Return the mean of the pollutants across all monitors in the id vector
    mean(val,na.rm=T)
}
