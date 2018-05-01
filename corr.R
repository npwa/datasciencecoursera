## This function takes a directory of data files and a threshold for
## complete cases and calculates the correlation between sulfate and
## nitrate for monitor locations where the number of completely
## observed cases (on all variables) is greater than the
## threshold. The function should return a vector of correlations for
## the monitors that meet the threshold requirement. If no monitors
## meet the threshold requirement, then the function should return a
## numeric vector of length 0

##
## We'll need this function here
source("complete.R")

corr <- function(directory,threshold=0)
{
    ## read in all data
    alldata <- complete(directory, 1:332)
    nobs <- alldata$nobs
    ids <- alldata$id[nobs>threshold]

    # This holds the length of vector ids
    id_len <- length(ids)
    corr_vector <- rep(0, id_len)
    # find all files in the specdata folder
    all_files <- as.character(list.files(directory))
    file_paths <- paste(directory, all_files, sep="/")
    j <- 1
    for(i in ids) {
        current_file <- read.csv(file_paths[i], header=T, sep=",")
        corr_vector[j] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
        j <- j + 1
    }
    result <- corr_vector
    return(result)   
}
