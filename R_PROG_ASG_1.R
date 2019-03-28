# programming assignment 1

#pollutantmean

pollutantmean <- function(directory, pollutant, id = 1:332) {
        mean_vector <- numeric() #vector to store means
        file_index <- sprintf("%0.3d", id) #read.csv directory modifier
        my_data <- list() #vector of list for temporary data storage
        obs_vector <- numeric() #vector for num of observations
        weight_vector <- numeric() #vector for weighted mean calculation
        
       for (i in seq_along(file_index)) {
            file_dir <- paste(directory, file_index[i], sep = "/") #dir. init.
            my_data <- read.csv(paste(file_dir, ".csv", sep = "")) #read data
            mean_vector[i] <- mean(my_data[[pollutant]], na.rm= TRUE) #means
            obs_vector[i] <- nrow(my_data[!is.na(my_data[[pollutant]]), ]) #obs
            weight_vector[i] <- mean_vector[i] * obs_vector[i] #weighted means
            if(is.nan(weight_vector[i]) | is.nan(obs_vector[i]) | is.nan(mean_vector[i])){
              weight_vector[i] <- 0
              obs_vector[i] <- 0
              mean_vector[i] <- 0
            }
       }
        sum(weight_vector)/sum(obs_vector) #weighted mean of every file

}

complete <- function(directory, id = 1:332) {
        file_index <- sprintf("%0.3d", id) #dir. init.
        my_data <- list() #temporary data list
        obs_vector <- numeric() #obs vector
        
        for(i in seq_along(file_index)){
                file_dir<- paste(directory, file_index[i], sep = "/") #dir. init
                my_data <- read.csv(paste(file_dir, ".csv", sep = "")) #read
                obs_vector[i]<- nrow(my_data[complete.cases(my_data),]) #obs 
        }
        what_is_matrix <- cbind(id, obs_vector) #matrix init
        colnames(what_is_matrix) <- c("id", "nobs") #colnames init
        what_is_matrix #return value
}




corr<- function(directory, threshold = 0) {
        my_data <- list() #temporary data list
        obs_vector <- numeric() #obs vector
        cor_vector <- numeric() #correlation vector
        file_index <- paste(directory, list.files(directory), sep="/")
        count <- 1
            for(i in seq_along(file_index)){
                  my_data <- read.csv(file_index[i])
                  l_data <- complete.cases(my_data)
                  cl_data <- my_data[complete.cases(my_data), ]
                  if(sum(l_data) > threshold){
                        cor_vector[count] <- cor(cl_data[["sulfate"]], cl_data[["nitrate"]])
                        count <- count + 1
                  }
                  
            }
            if(length(cor_vector) > 0){
              return(cor_vector)
            } else {
              x <- numeric()
              return(x)
            }
}


