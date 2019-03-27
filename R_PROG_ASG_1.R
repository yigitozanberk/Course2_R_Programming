# programming assignment 1

#pollutantmean

pollutantmean <- function(directory, pollutant, id = 1:332) {
        mean_vector <- numeric(length = length(id))
        file_index <- sprintf("%0.3d", 1:id)
        
       for (i in id) {
         file_dir <- paste(directory, file_index[i], sep = "/")
         my_data[i] <- read.csv()
       }
}