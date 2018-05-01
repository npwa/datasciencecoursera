## This function reads a directory full of files and reports the
## number of completely observed cases in each data file. The function
## returns a data frame where the first column is the name of the file
## and the second column is the number of complete cases

complete <- function(directory,id=1:332)
{
    fi <- list.files(path=directory,pattern=".csv",full.names=T)

    ## initialize empty vector
    nobs <- numeric()

    ## loop over all required IDs, add pollutant data
    for (i in id) {
        dat <- read.csv(fi[i])
        nobs <- c(nobs,sum(complete.cases(dat)))
    }
    data.frame(id,nobs)
}
