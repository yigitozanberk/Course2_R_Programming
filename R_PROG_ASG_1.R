# programming assignment 1

#pollutantmean

pollutantmean <- function(directory, pollutant, id = 1:332) {
        mean_vector <- numeric()
        file_index <- sprintf("%0.3d", id)
        my_data <- list()
        obs_vector <- numeric()
        weight_vector <- numeric()
        
       for (i in seq_along(file_index)) {
            file_dir <- paste(directory, file_index[i], sep = "/")
            my_data <- read.csv(paste(file_dir, ".csv", sep = ""))
            mean_vector[i] <- mean(my_data[[pollutant]], na.rm= TRUE)
            obs_vector[i] <- nrow(my_data[!is.na(my_data[[pollutant]]), ])
            weight_vector[i] <- mean_vector[i] * obs_vector[i]
       }
        sum(weight_vector)/sum(obs_vector)
}

complete <- function(directory, id = 1:332) {
        file_index <- sprintf("%0.3d", id)
        my_data <- list()
        obs_vector <- numeric()
        
        for(i in seq_along(file_index)){
                file_dir<- paste(directory, file_index[i], sep = "/")
                my_data <- read.csv(paste(file_dir, ".csv", sep = ""))
                obs_vector[i]<- nrow(my_data[complete.cases(my_data),])
        }
        what_is_matrix <- cbind(id, obs_vector)
        colnames(what_is_matrix) <- c("id", "nobs")
        what_is_matrix
}




